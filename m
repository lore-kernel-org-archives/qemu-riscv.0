Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DA9C982CD
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 07:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x76Am-0001vf-Ca; Thu, 17 Sep 2026 03:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x76Ak-0001uw-Pr
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 03:04:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x76Ai-000089-P3
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 03:04:42 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68H60H9G1721198
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 07:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V7kZEOGBMQR5JvaOy/ogdet/5X1WVzC2Ma3X9O7fsHY=; b=kykVkSCezAct+vAH
 lc6Nfz1iDnJGAAFuZVpyPjTRtqQ93Dw+bxvtqF3VAUlaIoBpsTkk+SbRaUtUs1rY
 z6Non2kFxNnbD2e8rj5w7nhaYctGewL3agAH5xmvAJmQQ7p1wlZ24gn0KyZ/6YeS
 fvPcRUk8Z3tAxyM24yUs5U6Bqhr2cdwmk9mqf9gqmQ0/uphT8PtmsP38ODI54Qp1
 E6oqbQhF9Q/blIyqGHZaARpyZwDZMsrr453y6FYh6e+pSidANwLfGOSmlxqeemub
 2NftBq04XKizn8k8ffjULb2PGnBCuR/x+0p+OfcOuBCie4zSh0dRXhZd1gEIlNxU
 6Ht/Ag==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m0y5a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 07:04:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8632fdf67dfso719494b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 00:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789628676; cv=none;
 d=google.com; s=arc-20260327;
 b=f0NnL7Qpl3taGTMR71if3UCOBd1EemkwW2r0cX6B+azb7v86CKLp2BA+TpJtx9Nnur
 PZ8uIe0LKvbpQ3S4Tki7No02HlJeCERhLdx0SGoPtWQSkLI1B2T/bZeLSGKysJ1LAcFq
 FX2r1LQi0YSx5FfuNTs1Ih0LhNrfz+5z2dEvxciszghH0sZzcSHJZ6fbVdl1sTUvIeVM
 k9Az5EAoB0iqtKa1GY1vS1FbKFJ6Mid+lWuBesh4fvUr2KDCcUu4visBdpQB+T7pp4RB
 BWDLDAvm/ZVZt++0nu5Mzyo88CBOcjvGiFgq299nuE0hKSUek3qeXAv0MQL2IncKYdS6
 HAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=V7kZEOGBMQR5JvaOy/ogdet/5X1WVzC2Ma3X9O7fsHY=;
 fh=6wlFAZwmykbEakDawIsXJ9N5Qf9DZoTXojKKF5xYQRY=;
 b=KniXUoOix68CYO2k+QVI5J43tH8ZMzZZBgSjexHE5eEdwf1B3+pJIPDvid6EFTqLFm
 xsHPtxnWiGHQSN5Z4fFJzLR2s6GpfeD3kwVesGEH+RmSPg/clTeXwRf+aYpU+aCCzJMV
 w5kH0rtdbPHdJOXsr2xbh4tOZMcFjiDD2ujxuFb49jhG3LifKCCvcAsjuc1p1CoTej9n
 HPK4CsYDSqUZE91mL8d3AS/FT6eKQNtVrTDCkaWJ4kRV4xCvwqzXzyB3OdUKXTD6+yuQ
 q7jGA2GRqp4fAgNddlaLYwaH9LfR9SRmxWMX0Kw2/WiKylhucUd75CyfLFs2BqMLep17
 QDvQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789628676; x=1790233476; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=V7kZEOGBMQR5JvaOy/ogdet/5X1WVzC2Ma3X9O7fsHY=;
 b=ioGnxPb8penFbmxUpUeZwmXr3S19yI/MuAexYgNJ3/hPa4DpjnTRi91CUEow4TFVnV
 N3KrT4ZQcR2K2Yj1v+Nmbuu9WqpCsjpwzZji5T2EkGggVDRBsCtkXTZ2aF+/59+XJhK7
 cAvdOGlPRlGQiy5W4WbhJvom/DgaC9pmWgNiggnexboKSINyC3NlZ/GOx242RjxssQxV
 YcLDtn+M7TU/1S89opaSU7M5T9Og+X9kefeyQuuGswJEaYPmjqpuYxGdcv/LRDURJ5ai
 Pyw0dG19zwHdEqeVnN66B8WNQ71B4p8kUZalNKhEIzigBfRp31AmtMgwJOUkQy9OnqVF
 3SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789628676; x=1790233476;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V7kZEOGBMQR5JvaOy/ogdet/5X1WVzC2Ma3X9O7fsHY=;
 b=EH0CkHsdpKElLKW1U9C1w1hHyiqYAKMo5M3LM2GT1UdadkckOunFE7sLuwgdETmb8u
 1PVWuMlm3U/pfibAnWRg+5Mks2kC4IrZMSILLk3EEqtMg97jPYV5tad+eGy2MGdDvmFL
 JEmOFZYj1Ee99ofSrrIf+6m83ZAC7ubKrUULNUQsyzAazEAQWlXUsQI0tgpzoF/5XfUc
 NEb91GiqsfIdqrvKNxmqkcJU80ASJF8i51jdxMsY8/EkJz0i8MJayCCTpx3ozrWHuw2A
 6J1V5M2aSwgfZ063SipY2ILYRd49nVB/WsAl7rSj8e3MWgLAqQFwA3c/9DOkukjmFqZL
 t9EQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy24Ya+M/qUkJvUPKVRDG20ZYi14KwV63cRHCusHD6r27gB5wh3OkaiDsiCoLyOI7OX7KzJNp+XLYpI@nongnu.org
X-Gm-Message-State: AFuF++lO+gedRfX6o8IB6hxCYAWYpyC8nbJj53H9+GxngVCcSRiBuTvX
 hf8eOiwuPJKCy9pW3Wq8jKy7njfcbNzNTqYPAve0K13L8/0F3tasjUuXCoJlA+8+vGvMYSdURjc
 x8ciAB8Z/tVJKWX+vK0EPSFc9BwyfkN3/HXyjGERQQjLrMdghDWgIBdC7ncdR3vvbtOnPeXYrfL
 O8JpG/FgT8MUq2SYh5A4mbf9aecvU+SDge
X-Gm-Gg: AYBFou1/wRAj4ovxrKCgoFJhNoDAQXQkPJd1IVP2HM2IVh7JDlTR0mqr27LLk8UyKQK
 xFQ6X/iq9CFJ649iVZli6bmYP2g4eYkRF0+jzIu+DNEYWIWXjgwXUaqdEORlmhPowoEZTHNsP2Q
 VQ4L5gg0lUd5eu+jrDnHPPHfnEeTR2U+LbljjRgfc1mCUGucyLb/ECUqcEsqU=
X-Received: by 2002:a05:6a00:a20b:b0:861:295:2d78 with SMTP id
 d2e1a72fcca58-87340f89b5fmr3538548b3a.3.1789628675463; 
 Thu, 17 Sep 2026 00:04:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:a20b:b0:861:295:2d78 with SMTP id
 d2e1a72fcca58-87340f89b5fmr3538501b3a.3.1789628674952; Thu, 17 Sep 2026
 00:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260907065112.2287127-1-mayuresh.chitale@oss.qualcomm.com>
 <57ee549f-9ffa-426a-abd8-95c9f8cbcc31@oss.qualcomm.com>
In-Reply-To: <57ee549f-9ffa-426a-abd8-95c9f8cbcc31@oss.qualcomm.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:34:23 +0530
X-Gm-Features: AcwNN1XczJdH5ZJSIPg09_edZ6Yp_CP7Kb9T7V95v_cH3MjdKaqCIFNJs82u4pI
Message-ID: <CAHuiULDH5=uH7ynsTT1pL_aOzo0CjU3UkMJ+yi0AKmrV+-Wtbg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Fix LCOFI interrupt masking in
 sie/sip/mvip
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Gong Shuai <gsh517025@gmail.com>,
 TianCheng TANG <lyndra@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aab9104 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=SRrdq9N9AAAA:8
 a=VGmdbzv3HwwXL7g1r8IA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: PWX8vPgA_7n3uBNtAVhHh3jjrSuYZ526
X-Proofpoint-ORIG-GUID: PWX8vPgA_7n3uBNtAVhHh3jjrSuYZ526
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfXzFLor8VwORc9
 fXDiiwJQrSXv+gjIV51Ae6P/kFq6O2cGLOCEZN3iu9TKtHxJmgOn/RpWgSwCOl7/nL58Z2hCMJx
 0c5TwaHOMG8uLhyDAdvRsFJFOvreQ+eXY4nuOlh2qCL5N30IxeTonGO2pgZ55K3wPbH3uVBjhG5
 PMMSqylIdt8pcfc91WdEeQ3K6CoUBIi1rrfv2U6O2Sn4yGaggVVTkPc+/3zbxe+zMEW7rNZSru9
 faahteFrF7a2rdaOQ73gWjVeVpEnU3Wel79OLgAsqWVDwt/MzPeT9OP2Qs7JXEmu2mJGI0AiPWs
 9YiemRCJ69pb7ploJyMUxbq/f/ZKyaidQD6YHDieFvkFPBGtbJ89ncCkq6AKEYzIKtJ1gXbSLPL
 exCVmuyJn/T0+Ern6UbFlsmebCbIYkQo458RXUJ854RI1dz/TtuoNsxhrMg+4ML6XbRFeWFCBku
 ZgwQFn9MiIIrTkChzug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfXw468V2sDIfvl
 S2TOD8KNKoqjKAk+aXnfOg4TIP62y1Ci0HasTFJgPescRocZsUIe25LF+CMXEDinjRsf1AH+gXg
 is30EV7Qe5F6ei1/jGICBJmcVbUhcKs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Sep 9, 2026 at 7:12=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
>
>
> On 9/7/2026 3:51 AM, Mayuresh Chitale wrote:
> > Commit 27f9566dcd98 dropped bit 13 (MIP_LCOFIP) from the LOCAL_INTERRUP=
TS
> > macro and hence also from individual masks such as all_ints,
> > sip_writable_mask etc.
> >
> > As a result, with Sscofpmf enabled and LCOFIP delegated to S-mode, the
> > overflow interrupt was raised in mip but was not visible in sip and it
> > never got delivered to the PMU driver. For the same reason, sie.LCOFIE
> > also became read-only 0.
> >
> > Add back bit 13 in the affected masks, but gate it on Sscofpmf being
> > implemented. In addition, for the virtual interrupt path, mvip/mvien
> > LCOFI also requires Smcdeleg and Smaia to be implemented. Also make
> > LCOFI delegable only if Sscofpmf is implemented.
> >
> > Fixes: 27f9566dcd98 ("target/riscv: Update the local interrupt mask")
> > Suggested-by: Gong Shuai <gsh517025@gmail.com>
> > Suggested-by: TianCheng TANG <lyndra@linux.alibaba.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Thanks Daniel. I am working on v3 that will also fix the broken kernel
sbi pmu selftest. I will add your RB in v3.
>
> > v2:
> > - Fix the sip.LCOFIP read-back mask in rmw_sip64() so that it matches
> >    the write path.
> > - Gate LCOFI on the Sscofpmf, Smcdeleg and Smaia extensions, depending
> >    on the register being accessed and on whether it is the virtual
> >    interrupt path.
> >
> >   target/riscv/tcg/csr.c | 59 +++++++++++++++++++++++++++++++++++------=
-
> >   1 file changed, 50 insertions(+), 9 deletions(-)
> >
> > diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> > index 002f7e69c1..966a0897bb 100644
> > --- a/target/riscv/tcg/csr.c
> > +++ b/target/riscv/tcg/csr.c
> > @@ -1812,7 +1812,7 @@ static RISCVException write_stimecmph(CPURISCVSta=
te *env, int csrno,
> >   #define LOCAL_INTERRUPTS   (~0xFFFFULL)
> >
> >   static const uint64_t delegable_ints =3D
> > -    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS | MIP_LCOFIP;
> > +    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS;
> >   static const uint64_t vs_delegable_ints =3D
> >       (VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & ~MIP_LCOFIP;
> >   static const uint64_t all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERRU=
PTS |
> > @@ -1874,6 +1874,25 @@ static const uint64_t hvien_writable_mask =3D LO=
CAL_INTERRUPTS;
> >
> >   static const uint64_t vsip_writable_mask =3D MIP_VSSIP | LOCAL_INTERR=
UPTS;
> >
> > +static bool lcofi_present(CPURISCVState *env, bool virt_int)
> > +{
> > +    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
> > +
> > +    if (!cfg->ext_sscofpmf) {
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * For the virtual interrupts path, we also need to check if smcde=
leg and
> > +     * smaia are both implemented.
> > +     */
> > +    if (virt_int && !(cfg->ext_smcdeleg && cfg->ext_smaia)) {
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> >   /* Machine Information Registers */
> >   static RISCVException read_zero(CPURISCVState *env, int csrno,
> >                                   target_ulong *val)
> > @@ -2248,6 +2267,10 @@ static RISCVException rmw_mideleg64(CPURISCVStat=
e *env, int csrno,
> >   {
> >       uint64_t mask =3D wr_mask & delegable_ints;
> >
> > +    if (lcofi_present(env, false)) {
> > +        mask |=3D wr_mask & MIP_LCOFIP;
> > +    }
> > +
> >       if (ret_val) {
> >           *ret_val =3D env->mideleg;
> >       }
> > @@ -2299,6 +2322,10 @@ static RISCVException rmw_mie64(CPURISCVState *e=
nv, int csrno,
> >   {
> >       uint64_t mask =3D wr_mask & all_ints;
> >
> > +    if (lcofi_present(env, false)) {
> > +        mask |=3D wr_mask & MIP_LCOFIP;
> > +    }
> > +
> >       if (ret_val) {
> >           *ret_val =3D env->mie;
> >       }
> > @@ -2349,6 +2376,10 @@ static RISCVException rmw_mvien64(CPURISCVState =
*env, int csrno,
> >   {
> >       uint64_t mask =3D wr_mask & mvien_writable_mask;
> >
> > +    if (lcofi_present(env, true)) {
> > +        mask |=3D wr_mask & MIP_LCOFIP;
> > +    }
> > +
> >       if (ret_val) {
> >           *ret_val =3D env->mvien;
> >       }
> > @@ -3784,6 +3815,10 @@ static RISCVException rmw_mip64(CPURISCVState *e=
nv, int csrno,
> >       uint64_t old_mip, mask =3D wr_mask & delegable_ints;
> >       uint32_t gin;
> >
> > +    if (lcofi_present(env, false)) {
> > +        mask |=3D wr_mask & MIP_LCOFIP;
> > +    }
> > +
> >       /*
> >        * When mvien[9]=3D1, mip.SEIP is read-only and reflects only
> >        * the external interrupt signal from the interrupt controller.
> > @@ -3897,9 +3932,11 @@ static RISCVException rmw_mvip64(CPURISCVState *=
env, int csrno,
> >        *  alias_mask denotes the bits that come from mip nalias_mask de=
notes bits
> >        *  that come from hvip.
> >        */
> > -    uint64_t alias_mask =3D ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> > +    bool virt_int =3D (csrno =3D=3D CSR_MVIP) || (csrno =3D=3D CSR_MVI=
PH);
> > +    uint64_t lcofi_mask =3D lcofi_present(env, virt_int) ? MIP_LCOFIP =
: 0;
> > +    uint64_t alias_mask =3D ((S_MODE_INTERRUPTS | lcofi_mask | LOCAL_I=
NTERRUPTS) &
> >           (env->mideleg | ~env->mvien)) | MIP_STIP;
> > -    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> > +    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_I=
NTERRUPTS) &
> >           (~env->mideleg & env->mvien);
> >       uint64_t wr_mask_mvip;
> >       uint64_t wr_mask_mip;
> > @@ -3928,8 +3965,8 @@ static RISCVException rmw_mvip64(CPURISCVState *e=
nv, int csrno,
> >           alias_mask &=3D ~MIP_STIP;
> >       }
> >
> > -    wr_mask_mip =3D wr_mask & alias_mask & mvip_writable_mask;
> > -    wr_mask_mvip =3D wr_mask & nalias_mask & mvip_writable_mask;
> > +    wr_mask_mip =3D wr_mask & alias_mask & (mvip_writable_mask | lcofi=
_mask);
> > +    wr_mask_mvip =3D wr_mask & nalias_mask & (mvip_writable_mask | lco=
fi_mask);
> >
> >       /*
> >        * For bits set in alias_mask, mvip needs to be alias of mip, so =
forward
> > @@ -4132,9 +4169,11 @@ static RISCVException rmw_sie64(CPURISCVState *e=
nv, int csrno,
> >                                   uint64_t *ret_val,
> >                                   uint64_t new_val, uint64_t wr_mask)
> >   {
> > -    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> > +    uint64_t lcofi_mask =3D lcofi_present(env, false) ? MIP_LCOFIP : 0=
;
> > +    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_I=
NTERRUPTS) &
> >           (~env->mideleg & env->mvien);
> > -    uint64_t alias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & e=
nv->mideleg;
> > +    uint64_t alias_mask =3D (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_IN=
TERRUPTS) &
> > +        env->mideleg;
> >       uint64_t sie_mask =3D wr_mask & nalias_mask;
> >       RISCVException ret;
> >
> > @@ -4379,7 +4418,9 @@ static RISCVException rmw_sip64(CPURISCVState *en=
v, int csrno,
> >                                   uint64_t new_val, uint64_t wr_mask)
> >   {
> >       RISCVException ret;
> > -    uint64_t mask =3D (env->mideleg | env->mvien) & sip_writable_mask;
> > +    uint64_t lcofi_mask =3D lcofi_present(env, false) ? MIP_LCOFIP : 0=
;
> > +    uint64_t mask =3D (env->mideleg | env->mvien) &
> > +                    (sip_writable_mask | lcofi_mask);
> >
> >       if (env->virt_enabled) {
> >           if (env->hvictl & HVICTL_VTI) {
> > @@ -4392,7 +4433,7 @@ static RISCVException rmw_sip64(CPURISCVState *en=
v, int csrno,
> >
> >       if (ret_val) {
> >           *ret_val &=3D (env->mideleg | env->mvien) &
> > -            (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
> > +            (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS);
> >       }
> >
> >       return ret;
> >
> > base-commit: a925240509d1b4b656cc480f1cc79ba4d7c8bc08
>

