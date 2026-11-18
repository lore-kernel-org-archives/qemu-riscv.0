Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6160A2601
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDuXhIA2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K44QmVuX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTgRw-0002CL-5p; Wed, 18 Nov 2026 09:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1xTgRl-00029Z-KT
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 09:15:37 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1xTgRj-00034w-EJ
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 09:15:37 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AIDQeZq1928893
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 14:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5k/duKR+6LJ2BpSZiLTaidBrk2eDLUtm+ZDrSdMYO5A=; b=UDuXhIA2chJjBIua
 THtQFms7pplJgaj60yU+MtTul8Yry24+4NL+8wLkLNFsDor0tmY/SHdV/ntxnV7O
 u+Wzv3Ip46FPUIeGBpRQUxTm7iakSJPCyirYiIh7qlURZ3fNjSZu/QrwDWO/I4et
 IDWzCmctiAwKCHkOlM76J0iweqLmRRG8ZgjMOSzPPbxAkuQHBjJ60FhSOA16uYJq
 G+ZOnXok2HmjBaHPFpOHGa+OFPIWWpp8WtfPgIKGbt0m9rgnj/3/SNsuq/egw9v3
 PwTOia+7HPuZKP+pqBQTP4lU59zIZ249jn3t2eGUcp6pB+0X3zS3NS4BocXoyFLv
 bvj45A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8bb2d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 14:15:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8b930598cf0so1468080b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 06:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795011330; cv=none;
 d=google.com; s=arc-20260327;
 b=mZPxV+p54z+TVg5WqAasf7FKQGnBsksgiBzk/rRLkxQCn91XKNZ9ZNwlMl75jbxIw7
 z52TR4JLEQGfw5hN5n7k6yPksEeWe20nhJlAHgo6CfDeVAj2rcH6FuFtOGI9nWpZ1WQC
 H0xb9U8jl3OhDSpyB1T8xQg1t8o9t/xM7Dw/Qe5BQQt3DSHdS0egrGvr51qhTaCVoce3
 n3WnaESdwcvm7xjzZEqUp8UU8J0gbnilnlpl+Y0RCSEwBlmilKdREg+0dUucvnKEildq
 kwmHeSubR2yfPy+010jvnpE3zu8r8DdZwZ9G1Tt46KEWw1NmG9Zg7SrfQRvsClX8xCUI
 QOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5k/duKR+6LJ2BpSZiLTaidBrk2eDLUtm+ZDrSdMYO5A=;
 fh=4XXeB3bhvEC+yEfURugJoGCKkkvBOoe/iwDbDYCHR8o=;
 b=bTGQEZd692AtGTFHA6hI4Pu/vpev2WeGlYq5I0H0ZU1Vq9EuLRpE9OdaFHociy0+qd
 8T3uIM3vOTaHTiy7kJ1uVKep2TtuY8VKBQAsBKF6zZypVe4Yrwrca8uPIvpgHAW6cOM7
 E2F7utF8HaPWpjplEZmKfLAM75iDI9Qxk4o1uAYIC658TjCZk3KA5NOgrabvgsJgTD9a
 SOs6a6Sg2fPNzSiFn+MJqHyMbUaBd4e2v7+uAJMoaqrcPmVEGCefLjW/OxYkoJvgdGfV
 /gfOV2XjHB6pHaWySpJXT1wXaFp38VFHGbo6BN290aSvgG65yg+ZA0DycZk2oDFluta9
 XhhA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795011330; x=1795616130; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5k/duKR+6LJ2BpSZiLTaidBrk2eDLUtm+ZDrSdMYO5A=;
 b=K44QmVuXWETGRAb+anezwQKkW1rE2dHP0GnAFdb3fLW6cQ7ytyBHqoWnGrwYGpR8Uf
 nyXy65SgAtE52COyOxp5AY4QIUf45pL16goU7GxZBwsMvCVAMhf9x5Es8D3C6OAc5jse
 LR7IkkA85HaKRTreZXA+e3x63W85LvE9KA4M0/J7gGSsA3NPmAZ+GQ82OoLcMOjZZoum
 ikF/PdF1pciCV7rAG6t0yNc7NWiBmM04ABxfOUiCl68gvfs+wnzhBWa3PABPuE4ijFGG
 ufBtQY2CCWLJC3x2XlL/ECp7MK0q9KPG8JsAW323W31J+TCGpgKOqnY423c5xG4hKdWG
 cMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795011330; x=1795616130;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5k/duKR+6LJ2BpSZiLTaidBrk2eDLUtm+ZDrSdMYO5A=;
 b=fRubZz5Gp8eTkn4WxAAcLEjkNUK33UM6ZcKO7FWyS8IhQUo5DZ6bVaLFig5BqCey1n
 VgyEJiF8KqsFDWpZMCog7DiuN3P8EH/E+beCjp4Fld0f8lasVd2YyCt3xKc4+CZ4aVnK
 WfJqApqxSQ6/W2BfCAQPD3wa+IxrDI0Jr7PpCU4KYfa4uW27oJG6fYDynf1ld1MzAX3M
 nOR+vzSFo4fxbb0kJawh/QjYI0YCf+7NYtKTgUuCSsQpxNXyXiweLJEW3wWcVNoVe8KK
 EGuyxKYsgxQjQMIQDi2w3EVwY6OikwEGYcUOOWxaGcn/S+ihDZarAQN+e7iU+HoI5bgz
 AN8Q==
X-Gm-Message-State: APuU4Z9DSJginBSsAN5JIigLN0kx0ShtHSfLhLY3NODI2Tzvk6ojt6ZH
 KFN2VmFVSw1lpRcfTn+q8tmQMLO+rCBLzMYvKZpVgyHYVHP5tQcYAOU0pP6DRdgAaSj4/9eSkok
 X8p3btZuBEerK5cD43eV2GVaGvkDF3on0juSpKJB4HgZoueHBPsbcxRZnTF90WZYAMlqEfjC896
 5LY+g1afwYUGf10W+8PDPcnSOvCxoF/8Xp
X-Gm-Gg: AYBFou0vIRRMGN6je3WBGj6JItx5fI4NJvMT0MIHHW+++z4gDO5RbUXgLIT27zV9TcY
 5zFXBd4Gp7I/l22gCr7aAJYo8D3HwvX3M/ahY0ZIekN03Vu8+6t3/uzQb5Qj8qDhg4oJprtlgXo
 y9Bgoc4y0th3RSFX7zDzbr6Ur+KEMd1Cq6PyFblf92zI6DAjGuuGme18LUPr8=
X-Received: by 2002:a05:6a00:1c91:b0:882:7bed:3b3b with SMTP id
 d2e1a72fcca58-8c5d43e76cbmr2429699b3a.36.1795011329512; 
 Wed, 18 Nov 2026 06:15:29 -0800 (PST)
X-Received: by 2002:a05:6a00:1c91:b0:882:7bed:3b3b with SMTP id
 d2e1a72fcca58-8c5d43e76cbmr2429670b3a.36.1795011328993; Wed, 18 Nov 2026
 06:15:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029131011.3715081-1-mayuresh.chitale@oss.qualcomm.com>
 <20261029131011.3715081-3-mayuresh.chitale@oss.qualcomm.com>
 <3f8c0c2c-208a-405e-9c7d-8a9fc90f9cfd@oss.qualcomm.com>
In-Reply-To: <3f8c0c2c-208a-405e-9c7d-8a9fc90f9cfd@oss.qualcomm.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:45:16 +0530
X-Gm-Features: AclHuK-1P_bNWYzcdet415ZVYjRqzTICUKIRuiAxj-c0Tk4W01R7O3fC0kNVq7g
Message-ID: <CAHuiULB7pidLYmO=QrbzYjPYnr4DZrdr1JoVsC5-_MAsosejNQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] target/riscv: Capture Sspesa sample PC and
 counter ID on overflow
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1t11uxMujwOwVuJVX9MZtraclfUuA3Yl
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afdb302 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=vmqqakdy-xN5SajVPjAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfXx5l1gYTo37nV
 Zyce5xlI3oC5pUtLDkper1se4nD0CANl4Takh3adn2k0Pw5b1fW2LfTpGtsnf9Ee+DfOhzMYaRX
 bazwyz9s323kS3nUBvdnAmjBsTHgyCOtB1g4Agf24glV/2B07hyuJRxcTHShEatLitlZpNJC1bt
 uFbdbuY2BlvB1Q/hXt9pkJkt6uNpQKm4Kkc48tcpYAUqH4ePq5XJxYChEWxNjysK5JSo6EO9KiM
 8eFO+EqfogMVFZsDko8Au0iY/pIirzzoojicqCXd/R1nf06osTbNHXvIpNzKTUlr+nIJS9Xfz67
 xOVpjGuzbXDLw/wnho5o2G1zvUgE+xdsDESRVQdSqAQZuxz3cgH9TgOgRpMMsVZ12KT6q37+9Br
 tzPRWRAKEVNx3jyuCtBO+FgM2mGPSkTKkUbJeo9VRGnSwsbHIGjjSgtmYBtS8w4vBy1GSwhp6Ac
 p7X5uopXGs1MIWkH/xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX159PtkFj1p6O
 xHKQ51LoC/NIff7L86AxQdqwthN8JXa4nbEzI/et2PT1O+j88hxFAarlsnzPvQG7M8YFvaULK8O
 CjVHyLIQxd4sB90OmA2nIrewNHcBh6U=
X-Proofpoint-GUID: 1t11uxMujwOwVuJVX9MZtraclfUuA3Yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 7, 2026 at 2:39=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
>
>
> On 10/29/2026 10:10 AM, Mayuresh Chitale wrote:
> > Capture shpmspc and shpmsdata just before updating mip.LCOFIP.
> > As required by the spec, record the current PC, counter ID and effectiv=
e
> > privilege mode. When supervisor counter delegation is enabled,
> > only overflows of delegated counters update the sample CSRs.
> >
> > Preserve shpmspc and shpmsdata while LCOFIP remains pending so later
> > overflows do not replace the pending sample. Currently, cntrid is not
> > updated if two counters overflow simultaneously.
> >
> > The captured PC is QEMU's current env->pc, so it provides best-effort
> > attribution rather than guaranteed precise attribution.
> >
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >   target/riscv/cpu_bits.h |  3 +--
> >   target/riscv/tcg/pmu.c  | 39 +++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 40 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 61258ce6e1..e99da434d5 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -642,9 +642,8 @@
> >   #define SHPMSDATA_CNTRID    0x1f
> >   #define SHPMSDATA_MODE      0x60
> >   #define SHPMSDATA_V         0x80
> > -#define SHPMSDATA_MODE_U    0x00
> > -#define SHPMSDATA_MODE_S    0x20
>
> These 2 macros were added in patch 1, never used there, and are now being=
 removed
> here.  Let's remove them in patch 1 instead (i.e. never add them in the f=
irst
> place).
>
>
>
> >   #define SHPMSDATA_VALID_MASK (SHPMSDATA_CNTRID | SHPMSDATA_MODE | SHP=
MSDATA_V)
> > +#define SHPMSDATA_MODE_SHIFT 5
> >
> >   /* Crypto Extension */
> >   #define CSR_SEED            0x015
> > diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
> > index 1a4658319b..31edd31117 100644
> > --- a/target/riscv/tcg/pmu.c
> > +++ b/target/riscv/tcg/pmu.c
> > @@ -178,6 +178,43 @@ void riscv_pmu_decr_instret(CPURISCVState *env)
> >       env->pmu_ctrs[2].mhpmcounter_prev++;
> >   }
> >
> > +static void riscv_pmu_sspesa_capture(CPURISCVState *env, uint32_t ctr_=
idx)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
>
> I believe this is something we should document somewhere, but env_archcpu=
() is a
> not the nicest call to make and we would like to avoid it every time we c=
an.  One
> of its main usages back in 2023 was to access the cpu->cfg pointer to che=
ck if a
> given extension is available.  We ended up creating an inline called risc=
v_cpu_cfg()
> to allow access to the CFG struct without having to call env_archcpu().
>
> So, if the code doesn't do anything else with the RISCVCPU pointer aside =
from reading
> cpu->cfg, we recommend using riscv_cpu_cfg() instead.
>
> For this code I suggest not using env_archcpu() and:
>
> > +    target_ulong sdata;
> > +    bool cde, ctr_enabled;
> > +
> > +    if (!cpu->cfg.ext_sspesa) {
>
>      if (!riscv_cpu_cfg(env)->ext_sspesa) {
>         return;
>      }
>
Thanks Daniel, I will fix these in the next version.
>
> Thanks,
> Daniel
>
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * When supervisor counter delegation is enabled only overflows of
> > +     * delegated counters update the sample CSRs.
> > +     */
> > +    cde =3D get_field(env->menvcfg, MENVCFG_CDE);
> > +    ctr_enabled =3D get_field(env->mcounteren, BIT(ctr_idx));
> > +    if (cde && !ctr_enabled) {
> > +        return;
> > +    }
> > +
> > +    sdata =3D ctr_idx;
> > +    sdata |=3D env->priv << SHPMSDATA_MODE_SHIFT;
> > +    if (env->virt_enabled) {
> > +        sdata |=3D SHPMSDATA_V;
> > +    }
> > +
> > +    /*
> > +     * Only the first overflow that raises LCOFIP updates the sample P=
C and
> > +     * metadata.  Currently updating CNTRID on simultaneous overflows =
is
> > +     * not supported.
> > +     */
> > +    if (!(env->mip & MIP_LCOFIP)) {
> > +        env->shpmspc =3D env->pc;
> > +        env->shpmsdata =3D sdata;
> > +    }
> > +}
> > +
> >   int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_=
idx)
> >   {
> >       uint32_t ctr_idx;
> > @@ -211,6 +248,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pm=
u_event_idx event_idx)
> >           /* Generate interrupt only if OF bit is clear */
> >           if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
> >               env->mhpmevent_val[ctr_idx] |=3D MHPMEVENT_BIT_OF;
> > +            riscv_pmu_sspesa_capture(env, ctr_idx);
> >               riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
> >           }
> >       } else {
> > @@ -403,6 +441,7 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
> >
> >       if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
> >           if (pmu_hpmevent_set_of_if_clear(env, ctr_idx)) {
> > +            riscv_pmu_sspesa_capture(env, ctr_idx);
> >               riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
> >           }
> >       }
>

