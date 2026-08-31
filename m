Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0429DC624A5
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 07:00:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0vzu-0000Yq-9D; Mon, 31 Aug 2026 03:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x0vzp-0000Xx-6p
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 02:59:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x0vzm-000109-JK
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 02:59:56 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52iMH2423465
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 06:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8+3c/sK0SFFkjgtqIIVLo/GIHCfM69vIAZuX33XepYw=; b=nWSB5sWkJIhr9VGY
 U6gZYSgKqU3Vu88YedGF+BaALqz62vgqpAJ8YhdPmHlr0lbUvdfEwyFf43Os+hfI
 gcoQyuPBlD086Agefwc7VNN6GketUy7qJytRkCaQ5sIbZJ8xwoNgxXfxK2ctKUdf
 tljZVGu5JOdllJiOvZHZxynKbZR1xMVHAk3g0iRTJRBacQg1ej3v/3kfIEiAl2fN
 6e1lIIK7rEhGLdJXGbamuUUh819aR2GKYyQ0uTZDaUKMtO7tq2IFBxegLXV/IUvl
 AHSyA1cgAebhcuvH97ZqDLdxzGzFc5FS7q4qkwHyK8naWg6kPLTcLWe5BFGGG7Kd
 PNfuAg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2d2r1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 06:59:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc1c1cc5206so2970750a12.3
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 23:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788159590; cv=none;
 d=google.com; s=arc-20260327;
 b=SBBKUPjxA3Dj9hvGPSvukG8bnlGvZwZOVzgTomK5rHTO9RDimxVEVgScvVNmeS1L82
 CeXS5odlKvTUQuxqr74mzX+UUwm/tLD5o2xvcmdB17mbfhBdAVtCqcyLdHmtfKtBJU1d
 0eFdyS0ZvCKbQwDEiLM1kOeeofjJ/TGWXE4dyQrggruJhxW4Fw1qaOd6usWbDc8ViJGZ
 Imb+Vlqykyg7Sxef4s/vyXwXltI9ONbU5MWyPTDvsYbQ0phMQYPstsWRD7dBUmNrepIr
 2sB/qzoYiJb1C1YWRM4QWRBl22RjKvmxo+aNXl8kWHJ3w7w8lRcTUTKLpRJZzEPwLZ8t
 GNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8+3c/sK0SFFkjgtqIIVLo/GIHCfM69vIAZuX33XepYw=;
 fh=L3kN8A7ckjiM6W6gfGwBcj4bjtJVf2mweDuCHs13IFo=;
 b=rzBYJ+BmloGdTYChG0wIs4AjCeo7YTxSuJXIK92AIN4ZxtQ9Ss54HfkfX6+g9N4l0b
 oJwC3SGIa/sOgKo6Otpt3gxQVaezLJE3BCt7xJdCQTCOzdeye44q4d3HW6mJJS27Ynt0
 FGG6s27Ic2Cd7y6MwQm17sRK+KyE5s37pS7TRGZspj/EvOj1LOUI6phWWvJB5U/pfUIV
 9IDlBaNtFEdk6oDPpv9vpHnuHjYcBnSpx0/Mo5F1qrl3GymG/YL0V99BXhsN+ahuGR4l
 D/Yi9z3zdiPr8OQfJzQTy7eEnBQ+/xP1cpeAr5Yzr+179hR9cPG89CXERpS7XoCDTcbG
 9lXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788159590; x=1788764390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8+3c/sK0SFFkjgtqIIVLo/GIHCfM69vIAZuX33XepYw=;
 b=QklmVSa7DbXIcOyhIeoiYiDy71/gUiE6Na8tX57c+Mej847yHHh/NuezRXnUFz0nTT
 NP+vS0xzJVpJE7cH9PdoXIfyeIp444vVlzI53jsoaIf1G52ilL4jn/7dhfjYrCYUZcTL
 J9zBFwVwnbwqo4zC05zLb8WgmK8K0xaRrMx7FfEA8IXq+7gvznEMAPb8ytunezT1reVv
 KCFylmoKTxWSnppfsx00bUV7/YPbu+YTQfTxkjJzkZ8VIX4E9Wd2+Vita9dq0wUfZDsg
 vcqbBoTRWDr+tbke47poKlI5qfTSq9EdMPuoIK8nPIKf1biV4/DMXYPpsTNlVw9npZ5w
 fdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788159590; x=1788764390;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8+3c/sK0SFFkjgtqIIVLo/GIHCfM69vIAZuX33XepYw=;
 b=U9mZHe1lC0yksCzolgY8KH1vrtbtvxb6OiYV1ZDYTXu/PGvP47eR9jSe9bIBHkWdma
 rbbVb2MgrJXi3vnUVB4laPx7m6Wo0FZhfBCAKdmh8aPphLd7jXZ21Nq1Fz0Rcr7r5TAP
 DTLKfCFDK7qcSdCoZ+3NKoIwbMtibk3kd2MwGoT/6+SsU8MTKbRGk2YenKAOQDpoaEiw
 fNa4g9G+CHVv0wVlQF090ivSqe6JukCNLFNWtRfBTauqQcfR4b0+Pm4GlhbL509euTil
 h9JSalIh9SSngOUx0eLtBMoYH5AZCctTnlJFx338PH/PRenM982dwbC6LE3vghCOzbC8
 l2Dg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqsL9aEBgjRX4h2+mfMvDmkl7HUspzYEIv2a3PXDz6nnmWiFujbhkJtpu+MQrai75abm1QxLUCu7+Gf@nongnu.org
X-Gm-Message-State: AFuF++kiQ/9KV6/Z2GcP6uOu7Qak4J1Ugk8OyqgD6owLs0zlVEkUhJv0
 i7DcPvmttEDxIBzHBszXiEihWZiaxeveHgMsAYnYzLKbe7yHWDow4OqK+cfGZv8MlIBOgLrI43p
 wb277MSAwjpip3yQuLoqhkdEkgOtfQBNrJ9b2DdFDyo7kd+dmIX6vFsdFoGD8Vxmebf+H+3MQUw
 Be8jdGAkTw9wh5Ydkpg+fAuUOFjOeUng65
X-Gm-Gg: AR+sD12aLbnu+uewD9WaBcUm30Q0mHcBbD7J12MZDMpLbniF4JGxHlkvJhHvVtL3ksV
 pDs9hM+3zcD7r0jC33YhrmSlz9AsiXHvq/UFPoilGXHjFowLhUMXgLLHSCNrIc8OOwHG8O12dGs
 n1Vi2eAXvO9ecE/DIOIVbTxkatNs3/1J8m13iMrHPD85go9Azn09BvXJI6/Rw=
X-Received: by 2002:a17:903:3b88:b0:2d8:df44:a5c2 with SMTP id
 d9443c01a7336-2d8df44b118mr228747255ad.20.1788159590337; 
 Sun, 30 Aug 2026 23:59:50 -0700 (PDT)
X-Received: by 2002:a17:903:3b88:b0:2d8:df44:a5c2 with SMTP id
 d9443c01a7336-2d8df44b118mr228746875ad.20.1788159589872; Sun, 30 Aug 2026
 23:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260813134002.862578-1-mayuresh.chitale@oss.qualcomm.com>
 <20260824133912.8475-1-gsh517025@gmail.com>
In-Reply-To: <20260824133912.8475-1-gsh517025@gmail.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:29:38 +0530
X-Gm-Features: AcwNN1WF8oZU-S0WdDqLtQStZMOFG-VLU2D7Ry4mVBhFV_IvA3oWHXygcWf5ue8
Message-ID: <CAHuiULC7GMcQKRczb4Q7PSrEOYNOd+O+w53Z0GJycTwZSw6nAA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix LCOFI masking in sie/sip/mvip
To: Gong Shuai <gsh517025@gmail.com>
Cc: alistair.francis@wdc.com, chao.liu@processmission.com,
 daniel.barboza@oss.qualcomm.com, liwei1518@gmail.com,
 palmer@dabbelt.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 zhiwei_liu@linux.alibaba.com, gong.shuai@sanechips.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a952667 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=ANOeVwrl4sSREQryxUIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: elAEFQungE1OZGjBu1YVxbTUja06DQ8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OCBTYWx0ZWRfX0Gl2MharLCcx
 n76avyYJksLma18hR649mT1I+HqpL4KB1huy2000Db5vUE6OYl1jDrNmicmYYEdxTIbOzaKAdaC
 ow79zAJjfIhft3btrydfUKF927eICJAjBBhuGChxngsK8eb+M35c2/8tVxR/AGPcdRFDlbFXI09
 sC7iXwYdVf4ZWP30zr0Fa/nHG1Tx8PVHB0mv1U3rtZVDO4xPngaIQfUZTvDztl8HMyJos8gBPYV
 yBQKjOBnZDo8rjTnhYXhPjm51Ka642S7PuflNOXtT/afYT3aNIzJksUggLp940K3Flpffhfvi1X
 Rv8DbgJLRoYB0FSeaVL2K8z/i8ZR3eez7aqaLtUfj5ZVM20CKXz8F9t8CF5r42uHwpK00YdmMRT
 cQWmCI6+DIjGR8EcXapm/52SBPu3/FbKlZ+WxwUF56q/dJx3OfWV39GJlTdYNRCcgik0b7/mgdO
 9F9dHmVwLZJypJy5y+Q==
X-Proofpoint-ORIG-GUID: elAEFQungE1OZGjBu1YVxbTUja06DQ8f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OCBTYWx0ZWRfX3Go1/CihShxD
 C6ESSzHh1/hMekWCIHtAn9z+u0YUffx3KVm6xrMCXOVWSRVMz3OHu82ltMaPCqwfmCIuoGcxF2v
 te7d/h6I7ovZE3/NcCl5T4pOk5BrWi8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310058
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

Hi Shuai,

On Mon, Aug 24, 2026 at 7:09=E2=80=AFPM Gong Shuai <gsh517025@gmail.com> wr=
ote:
>
> > Commit 27f9566dcd98 ("target/riscv: Update the local interrupt mask")
> > dropped bit 13 (MIP_LCOFIP) from the supervisor-visible interrupt masks=
.
> > As a result, with Sscofpmf enabled and LCOFIP delegated to S-mode, the
> > overflow interrupt would be raised in mip but never delivered and hence
> > perf sampling stopped receiving overflow interrupts.
> >
> > Re-add MIP_LCOFIP to all_ints, sip_writable_mask, mvip_writable_mask
> > to allow it to be writable again.
> >
> > Fixes: 27f9566dcd98 ("target/riscv: Update the local interrupt mask")
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
>
>
> Hi Mayuresh,
>
> I applied your patch on top of QEMU v11.1.0 and it fixes the perf samplin=
g
> regression.
>
> While the read path is still inconsistent with the write path:
>
> In rmw_sip64(), the read-back mask still truncates the result with
> (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS), which does not include bit 13.
> As a result, sip.LCOFIP always reads 0 even when mideleg.LCOFIP is set
> and mip.LCOFIP is pending. This contradicts the rule that sip[i] aliases
> mip[i] for bits delegated to S-mode, and it breaks consumers that check
> sip.LCOFIP.
>
> Would the following one-line change be suitable as a follow-up?

Yes, this change is required. I will add it in v2.

Thanks,
Mayuresh.
>
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -4378,7 +4378,8 @@ static RISCVException rmw_sip64(CPURISCVState *env,=
 int csrno,
>   if (ret_val) {
>  *ret_val &=3D (env->mideleg | env->mvien) &
> -            (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
> +            (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS | MIP_LCOFIP);
>   }
>
>   return ret;
> }
>
> Thanks for the fix and best regards,
> Shuai
>
>
> > ---
> >  target/riscv/tcg/csr.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> > index c05c8ee076..ca68c1f5f1 100644
> > --- a/target/riscv/tcg/csr.c
> > +++ b/target/riscv/tcg/csr.c
> > @@ -1890,7 +1890,8 @@ static const uint64_t delegable_ints =3D
> >  static const uint64_t vs_delegable_ints =3D
> >      (VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & ~MIP_LCOFIP;
> >  static const uint64_t all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERRUP=
TS |
> > -                                     HS_MODE_INTERRUPTS | LOCAL_INTERR=
UPTS;
> > +                                     HS_MODE_INTERRUPTS | MIP_LCOFIP |
> > +                                     LOCAL_INTERRUPTS;
> >  #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
> >                           (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
> >                           (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
> > @@ -1936,11 +1937,12 @@ static const target_ulong sstatus_v1_10_mask =
=3D SSTATUS_SIE | SSTATUS_SPIE |
> >
> >  /* Bit STIP can be an alias of mip.STIP that's why it's writable in mv=
ip. */
> >  static const uint64_t mvip_writable_mask =3D MIP_SSIP | MIP_STIP | MIP=
_SEIP |
> > -                                    LOCAL_INTERRUPTS;
> > +                                    MIP_LCOFIP | LOCAL_INTERRUPTS;
> >  static const uint64_t mvien_writable_mask =3D MIP_SSIP | MIP_SEIP |
> >                                      LOCAL_INTERRUPTS;
> >
> > -static const uint64_t sip_writable_mask =3D SIP_SSIP | LOCAL_INTERRUPT=
S;
> > +static const uint64_t sip_writable_mask =3D SIP_SSIP | SIP_LCOFIP |
> > +                                          LOCAL_INTERRUPTS;
> >  static const uint64_t hip_writable_mask =3D MIP_VSSIP;
> >  static const uint64_t hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP |
> >                                      MIP_VSEIP | LOCAL_INTERRUPTS;
> > @@ -3953,9 +3955,9 @@ static RISCVException rmw_mvip64(CPURISCVState *e=
nv, int csrno,
> >       *  alias_mask denotes the bits that come from mip nalias_mask den=
otes bits
> >       *  that come from hvip.
> >       */
> > -    uint64_t alias_mask =3D ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> > +    uint64_t alias_mask =3D ((S_MODE_INTERRUPTS | MIP_LCOFIP | LOCAL_I=
NTERRUPTS) &
> >          (env->mideleg | ~env->mvien)) | MIP_STIP;
> > -    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> > +    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | MIP_LCOFIP | LOCAL_I=
NTERRUPTS) &
> >          (~env->mideleg & env->mvien);
> >      uint64_t wr_mask_mvip;
> >      uint64_t wr_mask_mip;
> > @@ -4188,9 +4190,10 @@ static RISCVException rmw_sie64(CPURISCVState *e=
nv, int csrno,
> >                                  uint64_t *ret_val,
> >                                  uint64_t new_val, uint64_t wr_mask)
> >  {
> > -    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> > +    uint64_t nalias_mask =3D (S_MODE_INTERRUPTS | MIP_LCOFIP | LOCAL_I=
NTERRUPTS) &
> >          (~env->mideleg & env->mvien);
> > -    uint64_t alias_mask =3D (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & e=
nv->mideleg;
> > +    uint64_t alias_mask =3D (S_MODE_INTERRUPTS | MIP_LCOFIP | LOCAL_IN=
TERRUPTS) &
> > +        env->mideleg;
> >      uint64_t sie_mask =3D wr_mask & nalias_mask;
> >      RISCVException ret;
> >
> > --
> > 2.43.0

