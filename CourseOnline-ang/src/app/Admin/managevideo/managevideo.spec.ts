import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Managevideo } from './managevideo';

describe('Managevideo', () => {
  let component: Managevideo;
  let fixture: ComponentFixture<Managevideo>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Managevideo]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Managevideo);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
