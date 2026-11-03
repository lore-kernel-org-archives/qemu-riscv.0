Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB861606A327
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=CHZRELdR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xODXk-0007G7-Pv; Tue, 03 Nov 2026 07:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiangwencheng@lanxincomputing.com>)
 id 1xODXf-0007Fk-N2
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 07:23:09 -0500
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xiangwencheng@lanxincomputing.com>)
 id 1xODXZ-0004Mg-59
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 07:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1793708563;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=rWsXrmq+yxuJqEYK7uMUXFPVf6JuAdwdS1+fAz4stSA=;
 b=CHZRELdR9NR4ietmBg07fYSfOktAUVhsacRpiDgjyGbe/d/Nmfx8amxPHyC5g8oWRuuqtc
 j1wsfsYwnQbZtb7I9ZjBdXtehyt6co4mTyitjJiTMCfsKf/dFlw8vUqlSI+ShRLdapgbZ2
 CtUjl5Pcd0a6aey9YbVhJaRVTkUE0sB7J1O4MVNNu8+u63EePD6OlJsqGFciABQi/1RWao
 +H4ZKkbgbOsOnhG9RsYTVgcCZom8mRgj1ccpB8LCXQI7/rrMkm7JLJfLXppEK16FSWn7wB
 HHfj/mB5kCOA7cdgeA/5zQpff6vLTmR3mh9u/q4CtAzjiHWeAm8Qf1EI5z9Cog==
User-Agent: Mozilla Thunderbird
Cc: <alistair.francis@wdc.com>, <liwei1518@gmail.com>, 
 <zhiwei_liu@linux.alibaba.com>, <chao.liu@processmission.com>, 
 <anup@brainfault.org>, <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] hw/intc/aplic: Fix msicfgaddrH in split mode
Date: Tue, 3 Nov 2026 20:22:37 +0800
Message-Id: <fb0bb624-ac07-4362-b0b9-5372633da4f1@lanxincomputing.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae9d211+33db13+nongnu.org+xiangwencheng@lanxincomputing.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <bb98a0dd-d550-48fa-a713-2688ef06f3b9@oss.qualcomm.com>
Received: from [127.0.0.1] ([123.120.5.129]) by smtp.feishu.cn with ESMTPS;
 Tue, 03 Nov 2026 20:22:40 +0800
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>, 
 <palmer@dabbelt.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Content-Language: en-US
References: <20261102112256.848400-1-xiangwencheng@lanxincomputing.com>
 <bb98a0dd-d550-48fa-a713-2688ef06f3b9@oss.qualcomm.com>
Received-SPF: pass client-ip=209.127.231.27;
 envelope-from=xiangwencheng@lanxincomputing.com; helo=va-2-27.ptr.blmpb.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniel,

Thank you for the review. I'll resend the patch as v2.

Regarding splitting the patch: I'd prefer to keep it as a single patch,
since the two changes are coupled and can't work without each other.

Rationale (to be added to the commit message):

static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
                                  uint32_t hart_idx, uint32_t guest_idx,
                                  uint32_t eiid)
{
     uint64_t addr;
     MemTxResult result;
     RISCVAPLICState *aplic_m;
     uint32_t lhxs, lhxw, hhxs, hhxw, group_idx, msicfgaddr, msicfgaddrH;

     ...

     if (aplic->kvm_splitmode) {
         msicfgaddr =3D aplic->kvm_msicfgaddr;
1.        msicfgaddrH =3D ((uint64_t)aplic->kvm_msicfgaddrH << 32);
     }
     ...

     lhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
             APLIC_xMSICFGADDRH_LHXS_MASK;
     lhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXW_SHIFT) &
             APLIC_xMSICFGADDRH_LHXW_MASK;
     hhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXS_SHIFT) &
             APLIC_xMSICFGADDRH_HHXS_MASK;
     hhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
             APLIC_xMSICFGADDRH_HHXW_MASK;
     ...

     group_idx =3D hart_idx >> lhxw;

     addr =3D msicfgaddr;
2.    addr |=3D ((uint64_t)(msicfgaddrH & APLIC_xMSICFGADDRH_BAPPN_MASK))=
=20
<< 32;
     addr |=3D ((uint64_t)(group_idx &=20
APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw))) <<
              APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs);
3.    addr |=3D ((uint64_t)(hart_idx &=20
APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw))) <<
              APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs);
4.    addr |=3D (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs));
     addr <<=3D APLIC_xMSICFGADDR_PPN_SHIFT;
     ...
}

Since msicfgaddrH is left-shifted at (2), the left shift at (1) is=20
redundant.

At (3) and (4), hart_idx and guest_idx are masked/shifted using lhxw and=20
lhxs, which are extracted from the LHXW/LHXS fields of msicfgaddrH.=20
However, riscv_aplic_set_kvm_msicfgaddr() did not program the LHXW/LHXS=20
fields into kvm_msicfgaddrH, so lhxs/lhxw always read as zero, and the=20
hart/guest idxs were never encoded into the MSI address. Fix this by=20
programming hart_bits (LHXW) and guest_bits (LHXS) into kvm_msicfgaddrH=20
in riscv_aplic_set_kvm_msicfgaddr().

Thanks,
Bill


On 11/3/2026 6:02 PM, Daniel Henrique Barboza wrote:
>=20
>=20
> On 11/2/2026 8:22 AM, BillXiang wrote:
>> Add hart_bits and guest_bits to msicfgaddrH in KVM irqchip
>> split mode.
>> Also remove the redundant left shift when loading
>> kvm_msicfgaddrH in riscv_aplic_msi_send().
>=20
> I suggest doing two patches:=C2=A0 one for the hart_bits and guest_bits=
=20
> change and
> another one for the left shift.=C2=A0=C2=A0 Unless the left shift became =
redundant=20
> because
> of the hart_bits_and guest_bits made - then it's ok to keep it in a=20
> single patch.
>=20
>>
>> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
>> ---
>> =C2=A0 hw/intc/riscv_aplic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 13 +++++++++----
>> =C2=A0 hw/riscv/aia.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++++-
>> =C2=A0 include/hw/intc/riscv_aplic.h |=C2=A0 3 ++-
>> =C2=A0 3 files changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
>> index 03a0852b8b..2b618e73df 100644
>> --- a/hw/intc/riscv_aplic.c
>> +++ b/hw/intc/riscv_aplic.c
>> @@ -182,7 +182,8 @@ bool riscv_use_emulated_aplic(bool msimode)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return kvm_kernel_irqchip_split();
>> =C2=A0 }
>> -void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr=
)
>> +void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t=
 hart_bits, uint32_t=20
>> guest_bits)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!kvm_enabled()) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> @@ -191,8 +192,12 @@ void=20
>> riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (riscv_use_emulated_aplic(aplic->msimo=
de)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr >>=3D APLIC_=
xMSICFGADDR_PPN_SHIFT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aplic->kvm_msicfg=
addr =3D extract64(addr, 0, 32);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aplic->kvm_msicfgaddrH =3D e=
xtract64(addr, 32, 32) &
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 APLIC_MMSICFGADDRH_VALID_M=
ASK;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aplic->kvm_msicfgaddrH =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((ha=
rt_bits & APLIC_xMSICFGADDRH_LHXW_MASK) <<
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 APLIC_xMSICFGADDRH_LHXW_SHIFT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((gu=
est_bits & APLIC_xMSICFGADDRH_LHXS_MASK) <<
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 APLIC_xMSICFGADDRH_LHXS_SHIFT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ext=
ract64(addr, 32, 32) & APLIC_xMSICFGADDRH_BAPPN_MASK);
>=20
> Please add temporary variables like:
>=20
> uint64_t hart_bits_shift =3D ((hart_bits & APLIC_xMSICFGADDRH_LHXW_MASK)=
=20
> << APLIC_xMSICFGADDRH_LHXW_SHIFT)
> uint64_t guest_bits_shift =3D (guest_bits & APLIC_xMSICFGADDRH_LHXS_MASK)=
=20
> << APLIC_xMSICFGADDRH_LHXS_SHIFT)
>=20
> And then use the temp variables for the kvm_msicfgaddrH calculation.
>=20
> Also, please explain the rationale used.=C2=A0 Can be in code comment for=
mat=20
> or in the
> commit msg.
>=20
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> @@ -404,7 +409,7 @@ static void riscv_aplic_msi_send(RISCVAPLICState=20
>> *aplic,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (aplic->kvm_splitmode) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msicfgaddr =3D ap=
lic->kvm_msicfgaddr;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msicfgaddrH =3D ((uint64_t)a=
plic->kvm_msicfgaddrH << 32);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msicfgaddrH =3D aplic->kvm_m=
sicfgaddrH;
>=20
> Same thing here.=C2=A0 I'm assuming that this is now irrelevant due to th=
e=20
> hart_bits and
> guest_bits change, but instead of assuming it's better if you just=20
> explain why is
> this the case.
>=20
>=20
> Thanks,
> Daniel
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msicfgaddr =3D ap=
lic_m->mmsicfgaddr;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msicfgaddrH =3D a=
plic_m->mmsicfgaddrH;
>> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
>> index 56fc064533..bd608bd7a6 100644
>> --- a/hw/riscv/aia.c
>> +++ b/hw/riscv/aia.c
>> @@ -38,6 +38,7 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwaddr addr =3D 0;
>> +=C2=A0=C2=A0=C2=A0 uint32_t hart_bits, guest_bits;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *aplic_s_dev =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *aplic_m_dev =3D NULL;
>> @@ -93,7 +94,10 @@ DeviceState *riscv_create_aia(MemoryRegion *container=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msimode, false, a=
plic_m_dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (kvm_enabled() && msimode) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv_aplic_set_kvm_msicfgad=
dr(RISCV_APLIC(aplic_s_dev), addr);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hart_bits =3D imsic_num_bits=
(hart_count);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guest_bits =3D imsic_num_bit=
s(aia_guests + 1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv_aplic_set_kvm_msicfgad=
dr(RISCV_APLIC(aplic_s_dev), addr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hart_bit=
s, guest_bits);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return kvm_enabled() ? aplic_s_dev : apli=
c_m_dev;
>> diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/=20
>> riscv_aplic.h
>> index 62d2b33ade..d3ee2e537a 100644
>> --- a/include/hw/intc/riscv_aplic.h
>> +++ b/include/hw/intc/riscv_aplic.h
>> @@ -78,7 +78,8 @@ struct RISCVAPLICState {
>> =C2=A0 void riscv_aplic_add_child(DeviceState *parent, DeviceState *chil=
d);
>> =C2=A0 bool riscv_is_kvm_aia_aplic_imsic(bool msimode);
>> =C2=A0 bool riscv_use_emulated_aplic(bool msimode);
>> -void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr=20
>> addr);
>> +void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t=
 hart_bits, uint32_t=20
>> guest_bits);
>> =C2=A0 DeviceState *riscv_aplic_create(MemoryRegion *container,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwaddr addr, hwaddr size, uint32_t hartid=
_base, uint32_t num_harts,
>

