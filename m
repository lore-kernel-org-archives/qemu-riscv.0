Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nQYAw-0003ex-TH
	for mharc-qemu-riscv@gnu.org; Sat, 05 Mar 2022 12:26:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nQYAu-0003ek-QU; Sat, 05 Mar 2022 12:26:36 -0500
Received: from gloria.sntech.de ([185.11.138.130]:53578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nQYAq-0001gl-TS; Sat, 05 Mar 2022 12:26:36 -0500
Received: from wf0416.dip.tu-dresden.de ([141.76.181.160] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <heiko@sntech.de>)
 id 1nQYAj-00065p-TU; Sat, 05 Mar 2022 18:26:25 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Frank Chang <frank.chang@sifive.com>, Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
Date: Sat, 05 Mar 2022 18:26:24 +0100
Message-ID: <5780243.1I65i12eNQ@phil>
In-Reply-To: <CAOnJCULn7BbyfyeHpPQkyLTQyTcXrfu9wBheMAXDdFTnnRMphA@mail.gmail.com>
References: <20220222223830.2319856-1-atishp@rivosinc.com>
 <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
 <CAOnJCULn7BbyfyeHpPQkyLTQyTcXrfu9wBheMAXDdFTnnRMphA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Mar 2022 17:26:37 -0000

Hi,

Am Donnerstag, 3. M=C3=A4rz 2022, 19:58:38 CET schrieb Atish Patra:
> On Fri, Feb 25, 2022 at 11:46 PM Frank Chang <frank.chang@sifive.com> wro=
te:
> > Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >>
> >> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> >> property. It used to parse only the single letter base extensions
> >> until now. A generic ISA extension parsing framework was proposed[1]
> >> recently that can parse multi-letter ISA extensions as well.
> >>
> >> Generate the extended ISA string by appending  the available ISA exten=
sions
> >> to the "riscv,isa" string if it is enabled so that kernel can process =
it.
> >>
> >> [1] https://lkml.org/lkml/2022/2/15/263
> >>
> >> Suggested-by: Heiko Stubner <heiko@sntech.de>
> >> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >> ---
> >> Changes from v2->v3:
> >> 1. Used g_strconcat to replace snprintf & a max isa string length as
> >> suggested by Anup.
> >> 2. I have not included the Tested-by Tag from Heiko because the
> >> implementation changed from v2 to v3.
> >>
> >> Changes from v1->v2:
> >> 1. Improved the code redability by using arrays instead of individual =
check
> >> ---
> >>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
> >>  1 file changed, 29 insertions(+)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index b0a40b83e7a8..2c7ff6ef555a 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -34,6 +34,12 @@
> >>
> >>  /* RISC-V CPU definitions */
> >>
> >> +/* This includes the null terminated character '\0' */
> >> +struct isa_ext_data {
> >> +        const char *name;
> >> +        bool enabled;
> >> +};
> >> +
> >>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
> >>
> >>  const char * const riscv_int_regnames[] =3D {
> >> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, =
void *data)
> >>      device_class_set_props(dc, riscv_cpu_properties);
> >>  }
> >>
> >> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int m=
ax_str_len)
> >> +{
> >> +    char *old =3D *isa_str;
> >> +    char *new =3D *isa_str;
> >> +    int i;
> >> +    struct isa_ext_data isa_edata_arr[] =3D {
> >> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
> >> +        { "svinval", cpu->cfg.ext_svinval },
> >> +        { "svnapot", cpu->cfg.ext_svnapot },
> >
> >
> > We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs... etc.
> > Do you mind adding them as well?
> >
>=20
> Do we really need it ? Does any OS actually parse it from the device tree=
 ?
> AFAIK, Linux kernel doesn't use them. As the device tree is intended
> to keep the information useful
> for supervisor software,

That actually isn't true ;-) .

The devicetree is intended to _describe_ the hardware present in full
and has really nothing to do with what the userspace needs.
So the argument "Linux doesn't need this" is never true when talking
about devicetrees ;-) .

On the other hand the devicetree user doesn't need to parse everything
from DT. So adding code to parse things only really is needed if you
need that information.

So if some part of the kernel needs to know about those additional
extensions, the array entries for them can also be added in a later patch.


Heiko

> > Also, I think the order of ISA strings should be alphabetical as descri=
bed:
> > https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L96
> >
>=20
> Ahh yes. I will order them in alphabetical order and leave a big
> comment for future reference as well.
>=20
> > Regards,
> > Frank Chang
> >
> >>
> >> +    };
> >> +
> >> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> >> +        if (isa_edata_arr[i].enabled) {
> >> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL=
);
> >> +            g_free(old);
> >> +            old =3D new;
> >> +        }
> >> +    }
> >> +
> >> +    *isa_str =3D new;
> >> +}
> >> +
> >>  char *riscv_isa_string(RISCVCPU *cpu)
> >>  {
> >>      int i;
> >> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
> >>          }
> >>      }
> >>      *p =3D '\0';
> >> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
> >>      return isa_str;
> >>  }
> >>
> >> --
> >> 2.30.2
> >>
>=20
>=20
>=20





