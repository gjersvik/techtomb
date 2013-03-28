part of htmlblock_game;

class Collision extends ContactListener{
  void beginContact(Contact contact){}
  void endContact(Contact contact){}
  void preSolve(Contact contact, Manifold oldManifold){
    if(contact.fixtureA.userData is BodyObject){
      (contact.fixtureA.userData as BodyObject).preContact(contact, contact.fixtureB);
    }
    if(contact.fixtureB.userData is BodyObject){
      (contact.fixtureB.userData as BodyObject).preContact(contact, contact.fixtureA);
    }
  }
  void postSolve(Contact contact, ContactImpulse impulse){
    if(contact.fixtureA.userData is BodyObject){
      (contact.fixtureA.userData as BodyObject).postContact(contact, contact.fixtureB, impulse);
    }
    if(contact.fixtureB.userData is BodyObject){
      (contact.fixtureB.userData as BodyObject).postContact(contact, contact.fixtureA, impulse);
    }
  }
}