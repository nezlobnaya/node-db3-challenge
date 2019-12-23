const db = require('../data/db-config')

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    findStepById,
    // update,
    // remove,
}

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes').where({ id }).first()
}

function findStepById(id) {
    return db('steps').where({ id }).first()
}

function findSteps(schemeId) {
    return db('steps as s')
        .select('s.id', 's.step_number', 's.instructions', 'sch.scheme_name')
        .join('schemes as sch', 'sch.id', 's.scheme_id')
        .where('sch.id', schemeId)
}

function add(scheme) {
    return db('schemes').insert(scheme)
    .then( ids => {
        return findById(ids[0])
    })
}

function addStep(step, id) {
    return db('steps')
    .join('schemes as sch', 's.scheme_id')
    .where({ id }).insert(step, id)
    .then(ids => {
       return findStepById(ids[0])
    }) 
}

