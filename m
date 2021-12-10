Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvcf4-0000oA-12
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 04:57:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mvcf2-0000gF-49; Fri, 10 Dec 2021 04:57:52 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mvcez-0003Ee-7q; Fri, 10 Dec 2021 04:57:51 -0500
Received: from canpemm100005.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J9RC31fXNz92xw;
 Fri, 10 Dec 2021 17:57:03 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 canpemm100005.china.huawei.com (7.192.105.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:57:43 +0800
Received: from kwepemm600017.china.huawei.com ([7.193.23.234]) by
 kwepemm600017.china.huawei.com ([7.193.23.234]) with mapi id 15.01.2308.020;
 Fri, 10 Dec 2021 17:57:42 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Anup Patel <anup@brainfault.org>
CC: QEMU Developers <qemu-devel@nongnu.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, "kvm-riscv@lists.infradead.org"
 <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, Anup Patel
 <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, "Fanliang
 (EulerOS)" <fanliang@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>,
 "Wanghaibin (D)" <wanghaibin.wang@huawei.com>, "wanbo (G)"
 <wanbo13@huawei.com>, "limingwang (A)" <limingwang@huawei.com>
Subject: RE: [PATCH v1 04/12] target/riscv: Implement kvm_arch_get_registers
Thread-Topic: [PATCH v1 04/12] target/riscv: Implement kvm_arch_get_registers
Thread-Index: AQHX3eLLjNdjzYP2iE6AIP7NO6R7r6wf2ceAgAvDAxA=
Date: Fri, 10 Dec 2021 09:57:42 +0000
Message-ID: <7d88cc865bcc4dada21cfe09d9665d73@huawei.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-5-jiangyifei@huawei.com>
 <CAAhSdy2gFufV4Xuu9Ewn2htLRB8SZ+xohbAnjYmnM1D_xMQP4A@mail.gmail.com>
In-Reply-To: <CAAhSdy2gFufV4Xuu9Ewn2htLRB8SZ+xohbAnjYmnM1D_xMQP4A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.236]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangyifei@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 09:57:52 -0000


> -----Original Message-----
> From: kvm-riscv [mailto:kvm-riscv-bounces@lists.infradead.org] On Behalf =
Of
> Anup Patel
> Sent: Friday, December 3, 2021 2:20 PM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: QEMU Developers <qemu-devel@nongnu.org>; open list:RISC-V
> <qemu-riscv@nongnu.org>; kvm-riscv@lists.infradead.org; KVM General
> <kvm@vger.kernel.org>; libvir-list@redhat.com; Anup Patel
> <anup.patel@wdc.com>; Palmer Dabbelt <palmer@dabbelt.com>; Alistair
> Francis <Alistair.Francis@wdc.com>; Bin Meng <bin.meng@windriver.com>;
> Fanliang (EulerOS) <fanliang@huawei.com>; Wubin (H)
> <wu.wubin@huawei.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
> wanbo (G) <wanbo13@huawei.com>; limingwang (A)
> <limingwang@huawei.com>
> Subject: Re: [PATCH v1 04/12] target/riscv: Implement kvm_arch_get_regist=
ers
>=20
> On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote=
:
> >
> > Get GPR CSR and FP registers from kvm by KVM_GET_ONE_REG ioctl.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Mingwang Li <limingwang@huawei.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/kvm.c | 150
> > ++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 149 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c index
> > 9f9692fb9e..b49c24be0a 100644
> > --- a/target/riscv/kvm.c
> > +++ b/target/riscv/kvm.c
> > @@ -55,13 +55,161 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState
> *env, uint64_t type, uint64_t idx
> >      return id;
> >  }
> >
> > +#define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env,
> KVM_REG_RISCV_CORE, \
> > +                 KVM_REG_RISCV_CORE_REG(name))
> > +
> > +#define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env,
> KVM_REG_RISCV_CSR, \
> > +                 KVM_REG_RISCV_CSR_REG(name))
> > +
> > +#define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env,
> > +KVM_REG_RISCV_FP_F, idx)
> > +
> > +#define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env,
> > +KVM_REG_RISCV_FP_D, idx)
> > +
> > +static int kvm_riscv_get_regs_core(CPUState *cs) {
> > +    int ret =3D 0;
> > +    int i;
> > +    target_ulong reg;
> > +    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->pc =3D reg;
> > +
> > +    for (i =3D 1; i < 32; i++) {
> > +        uint64_t id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> > +        ret =3D kvm_get_one_reg(cs, id, &reg);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +        env->gpr[i] =3D reg;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static int kvm_riscv_get_regs_csr(CPUState *cs) {
> > +    int ret =3D 0;
> > +    target_ulong reg;
> > +    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, sstatus), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->mstatus =3D reg;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, sie), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->mie =3D reg;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, stvec), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->stvec =3D reg;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, sscratch), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->sscratch =3D reg;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, sepc), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->sepc =3D reg;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, scause), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->scause =3D reg;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, stval), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->stval =3D reg;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, sip), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->mip =3D reg;
> > +
> > +    ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env, satp), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->satp =3D reg;
>=20
> There is a common pattern in above kvm_get_one_reg() calls so I suggest
> creating a macro for repeating code patterns. This can help us to have on=
e line
> for each CSR and in future it is easy to add more CSRs.
>=20
> Regards,
> Anup
>=20

Thanks, it will be modified in the next series.

Yifei

> > +
> > +    return ret;
> > +}
> > +
> > +static int kvm_riscv_get_regs_fp(CPUState *cs) {
> > +    int ret =3D 0;
> > +    int i;
> > +    CPURISCVState *env =3D &RISCV_CPU(cs)->env;
> > +
> > +    if (riscv_has_ext(env, RVD)) {
> > +        uint64_t reg;
> > +        for (i =3D 0; i < 32; i++) {
> > +            ret =3D kvm_get_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> > +            if (ret) {
> > +                return ret;
> > +            }
> > +            env->fpr[i] =3D reg;
> > +        }
> > +        return ret;
> > +    }
> > +
> > +    if (riscv_has_ext(env, RVF)) {
> > +        uint32_t reg;
> > +        for (i =3D 0; i < 32; i++) {
> > +            ret =3D kvm_get_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> > +            if (ret) {
> > +                return ret;
> > +            }
> > +            env->fpr[i] =3D reg;
> > +        }
> > +        return ret;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >  const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
> >      KVM_CAP_LAST_INFO
> >  };
> >
> >  int kvm_arch_get_registers(CPUState *cs)  {
> > -    return 0;
> > +    int ret =3D 0;
> > +
> > +    ret =3D kvm_riscv_get_regs_core(cs);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    ret =3D kvm_riscv_get_regs_csr(cs);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    ret =3D kvm_riscv_get_regs_fp(cs);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    return ret;
> >  }
> >
> >  int kvm_arch_put_registers(CPUState *cs, int level)
> > --
> > 2.19.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
>=20
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

