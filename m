Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABE5C5B572
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 04:44:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwY9h-0004sc-UU; Wed, 19 Aug 2026 00:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wwY9g-0004sH-W7
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 00:44:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wwY9d-0003Q0-C9
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 00:43:59 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67J2lacA1954686
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 04:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5t9q+WvjoT+WMD0oQPl8sGVZdybNRwlwaiQZ6fp7Fg4=; b=bdJCyZ2Gql4ePB0O
 YbZG/30kMwi8X22ZeL/fw3SAGs1wIbibvLZcNbNpqDrLYj85ma/kZcnb9bGkShyo
 Om/D6SISNvrWNJkpDAoFBpw6a7PBg0Ajp9fL4zbxk+2nKdDAWg+XCTjEOYmApXkb
 f5jwMvuir5Mcvug/uaOp3NP7NmPm6fHD7qfsJfFvUgz4f9G2xwXSTv2Wm0kqUQCF
 ISpkcK/E/h3EMWQ3X2h6TAXUrrBumpnzSQWx4Ph2eglCzjxvtOyr3j/mwqruSY+5
 nMFV2neweneGeevhyAnFNjEY2R6gu/wRjBaIuLSSaIZu2JVX4bGsaJ3kBvJoNNKm
 y1sXGA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk9bb0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 04:43:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-756fd28d906so28478137.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 21:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787114633; cv=none;
 d=google.com; s=arc-20260327;
 b=HuKrqpy18TTjRfweSawoVhb8J8S2qqddqY4jeU9xOjbZT7Z7eqkN/mFgVSsvN1aXqe
 3Rjc62jOQvzR6PkCUsOD8DMVVtv79EgsTzN59tEB0ckHHGkE6DjXW7D9xXLzHgjyFzF5
 eZiuRfbWrS0BVN1fjeqOUT35xklSbiZ/RDz8b93uewxEBU5fwAeRTciR1aFe9EgGjKUN
 4fIrvzTDnc58nITE2EhCucEV5tAnsK3vzvAH1NygvYu2YpM1+n828Qw5o86oXpRBJ3Hw
 Kuqq8zlv58vqIeDOWtu45/4GApxGsPhAdFrxDXfsDK110n6oqs/a+niNfdBaLjW/gq2e
 9emA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5t9q+WvjoT+WMD0oQPl8sGVZdybNRwlwaiQZ6fp7Fg4=;
 fh=GmAQ/ce1U1qIP5O5zGfMzd90EBmpUDSqJEy3RSzY490=;
 b=jZCteGPflD+ze6HZEx5/x97F9ho+z5QJ0TN3qkkC1Nuxr82MH9g2OonNUVpy7txPD/
 kfB/SnfsqF3Ti2k40rYQKgR+xrwJu2e2TSZcQbsdRqaoR6+AgGbqFUxAf/UzH83nKbL3
 kaBUNCaphgvwNzEMQ1+N+4+rQFBvPRdz7ATmnRDneOYav5vWipUDYHTbrHj7pzAHjJJo
 xH85AgSXIX5X6erYhEvXcvsQQUMm9Yymhi5+jBFn9v1gFSzPSyKFtlJOZNNggjZEhI0s
 Vwau5c+wQsRTVgVI3Fwj2sN1S+TkwBfgLZGDez3V6ed0mJgq9EpMRGr52UaTOkZnyMnc
 Hlzw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787114633; x=1787719433; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5t9q+WvjoT+WMD0oQPl8sGVZdybNRwlwaiQZ6fp7Fg4=;
 b=bGf7a8QgC+H+2Fo0OU1/ft8eLZlovF/OiJ2YA4WfqbSx6+3ypU6mwo2Jsw5pQntIuL
 udlh/5E8l+ek9fV1wrW8M6poBzH1LFdCDz2oxdd5IEGgach3IiV7tGFOGIcwGI7SJJ+0
 b69nb40PQRnpyTm9BC7cr0HiIORyoF1UmwSUeCizwE/hCc5Ux5qpsNVChr/Vtch5rYa/
 P4kLJKfIXhZf3WfNHeaPGd2n1qNYQJIqR2fBcQftk4b5rjn1arWG30nXlDP6ujw+Ubty
 YXYbyc+IDGh12TLVpPmKeUibKEVSmnJbinYVtvzjzPQW6+mFdI+23vSzbrPABSpwNrku
 BZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787114633; x=1787719433;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5t9q+WvjoT+WMD0oQPl8sGVZdybNRwlwaiQZ6fp7Fg4=;
 b=PZljkrdkbTaydhJ78hhvgdDnAgk3gyET39Nva55tn647EJDddLiFEWtd6/0iLa0uhj
 5YkRiQkZvIIilON7g9DPuDxP9xLsVfNYS5VYDuyuvuvvr3pmk+8mw3uEM6JKLXlJ+HTq
 keoWuetXi19hwEgS0E1XsXr0atb1Fh926OD5pfslRmh8in6WD1hx4zOnDoGI6e1OZhuC
 e5Xi+Onr3cqPgcFN0flCgyu0a4L9jvPjTj9ZX1iFqYREjspPgiABj+fFMdZnqae/E14x
 Jwbz4hHq/caYHPMfEf53XPRJdokHTEw9mtYOs4gRp+t+sczxSDATSXIgZtM1nZMj/fkw
 a9nw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYryWF+ktFDaefpMd74g4cVoswwg+h0p6HTJh599jhEHrXPhzUQ+VtBFnwgv1FmGl5DNhmerQcV71c@nongnu.org
X-Gm-Message-State: AOJu0YwNd1/hnXB62b8lhQIEEHlMwT5ZoEYFqNKzHbpm59mkt076woK2
 xzaIOsVXhBKv5rbVA8nf4Fo78xT4fEgrkJuDypRDayiyOXajtaqt7UEnjsjVpiTTDym8skAvNfF
 428QwldQbOPKlaSPEnrI+ovUloJvUWrnlTDcfn4/s634LIHxqKAl1qSMZcBA6NmaC7GUAQ1FE2d
 6WvLkPP6dUEiRgcZIZLKyohList3Sw/aDx
X-Gm-Gg: AR+sD12ykOO7Y346cV/+G1qLAOBjNGYvOEH0LBI68tC4xs9KLOeLrAao9fbzlYXqLa0
 9j24r5GDC29bgl+di8LI9aZCWSSzOIyjfuc6q0ncLJUpav5WwlcIIYdrecfiTXIAAMCSAhbcPkO
 bgoU6YYffPr7M/ehfuUiGANwqcQSN5tzqnUTCeD6e5DdNgq/iufqOviL7Z/uo=
X-Received: by 2002:a05:6102:3fa4:b0:6d1:8f7:18a5 with SMTP id
 ada2fe7eead31-777fa6981e3mr215073137.1.1787114633042; 
 Tue, 18 Aug 2026 21:43:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa4:b0:6d1:8f7:18a5 with SMTP id
 ada2fe7eead31-777fa6981e3mr215060137.1.1787114632579; Tue, 18 Aug 2026
 21:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260817105505.2607506-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260817105505.2607506-6-subrahmanya.lingappa@oss.qualcomm.com>
 <TY2PPF45B8CB2DBC8E1E6080020BC2FC09EF9A62@TY2PPF45B8CB2DB.apcprd03.prod.outlook.com>
In-Reply-To: <TY2PPF45B8CB2DBC8E1E6080020BC2FC09EF9A62@TY2PPF45B8CB2DB.apcprd03.prod.outlook.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 10:13:41 +0530
X-Gm-Features: AcwNN1UtxOGx4J1QOPjseVngGs3AguimiQxLdb25TFSiqMPtKoqK7_PwE0_ArQU
Message-ID: <CAPxK-6fkm-yKJM+9GhVeDRBnCxmTfA8bFNw63zghd4NJTqbraA@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] riscv: add RPMI system reset service
To: Ranbir Singh <saini.ranbirs@outlook.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a853489 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=UqCG9HQmAAAA:8 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8
 a=pJbosEGKlLa1EOqhbsUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzMyBTYWx0ZWRfX9chUEpm0A0X2
 L/iD0f8YaPvtpI8Wx0ohHGA2pZ/5dt2UEmXoEdnO3eJJ7VwGe5NPuRa/SjibBwhGYaVMQSSO1z8
 chkYrlAJdifD95ShUJrVmKkAbhizGy0HMTP9NNV3iRD3S3JbDrDMEEIhiAXJKgzYqECK0lUWgdT
 250ZOVTJ/MQuycRnjWnx8GG4dcMzB+TEvPJ3/X8KMSjT/1w5F2Ma338KH5VkRh0QCFGvLUuLP0W
 UViM5x0kivKjiDpIj6bsfKtDrTB7ZOqBDMKfsiJz9f/MN0lZzKIGH9xd4cJz6/jyUJDKtwLTjSf
 d9+ry2+8fTj22HSWGtBjVCvRS48AWbLDYzJFkHbugRZ1Ylvvmak7GU/Ed3Uv5Rc9mMrKuYH7AJE
 apETAvefLTQme1fvua3c/c//kbwva72RXOV9FHiQXs0lJua2/jkg0fCRNJrpplF4sR2ApPQht8c
 gMP6NhmQmoPPcMPRuiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzMyBTYWx0ZWRfX7QZTSi47ApmA
 KrKIsGui2WnxiW1W2jdfMPX/hKjzKscbPfqZBNoFUIzGNG9ktE3sOVkCyVXsWixGiAIUFt/qjtq
 MB9FCLjVMnZ6MzKEp2f8IASxavxgzyw=
X-Proofpoint-GUID: bXQ6llKr0kkJbAr7jUyD1zqDvOnOO-2A
X-Proofpoint-ORIG-GUID: bXQ6llKr0kkJbAr7jUyD1zqDvOnOO-2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190033
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Ranbir,

On Tue, Aug 18, 2026 at 11:36=E2=80=AFAM Ranbir Singh <saini.ranbirs@outloo=
k.com> wrote:
>
>
>
>
> ________________________________________
> From: qemu-devel-bounces+saini.ranbirs=3Doutlook.com@nongnu.org <qemu-dev=
el-bounces+saini.ranbirs=3Doutlook.com@nongnu.org> on behalf of Subrahmanya=
 Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> Sent: 17 August 2026 16:24
> To: qemu-devel@nongnu.org
> Cc: qemu-riscv@nongnu.org; Subrahmanya Lingappa; Daniel Henrique Barboza;=
 Palmer Dabbelt; Alistair Francis; Weiwei Li; Liu Zhiwei; Chao Liu
> Subject: [PATCH v9 05/10] riscv: add RPMI system reset service
>
> Add a QEMU implementation of the RPMI System Reset service group.
>
> The service advertises shutdown and cold reboot reset types, validates
> guest requests, and dispatches accepted requests through the machine
> reset and shutdown callbacks. This lets firmware use RPMI reset commands
> while keeping the board-specific reset policy in the RISC-V virt machine.
>
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.co=
m>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>  hw/misc/meson.build           |   1 +
>  hw/misc/riscv_rpmi.c          |  70 +++++++++++-
>  hw/misc/riscv_rpmi_internal.h |  12 +-
>  hw/misc/riscv_rpmi_sysreset.c | 206 ++++++++++++++++++++++++++++++++++
>  hw/riscv/virt.c               |  51 ++++++++-
>  include/hw/misc/riscv_rpmi.h  |  15 +--
>  include/hw/riscv/rpmi-fdt.h   |  11 ++
>  7 files changed, 349 insertions(+), 17 deletions(-)
>  create mode 100644 hw/misc/riscv_rpmi_sysreset.c
>
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index fb761f94b3..f8a317b8f6 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -173,4 +173,5 @@ system_ss.add(when: 'CONFIG_LASI', if_true: files('la=
si.c'))
>  system_ss.add(when: 'CONFIG_AXIADO_CLK', if_true: files('axiado_clk.c'))
>  system_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: [files(
>    'riscv_rpmi.c',
> +  'riscv_rpmi_sysreset.c',
>  ), librpmi], if_false: files('riscv_rpmi-stub.c'))
> diff --git a/hw/misc/riscv_rpmi.c b/hw/misc/riscv_rpmi.c
> index 8598a3f133..97517766e9 100644
> --- a/hw/misc/riscv_rpmi.c
> +++ b/hw/misc/riscv_rpmi.c
> @@ -171,10 +171,37 @@ static bool riscv_rpmi_transport_indices_valid(Risc=
vRpmiState *s)
>                                            s->a2p_req_size);
>  }
>
> +typedef struct RiscvRpmiServiceOps {
> +    uint32_t service_group;
> +    bool (*add)(RiscvRpmiState *s, Error **errp);
> +    void (*remove)(RiscvRpmiState *s);
> +} RiscvRpmiServiceOps;
> +
> +static const RiscvRpmiServiceOps riscv_rpmi_service_ops[] =3D {
> +    {
> +        .service_group =3D RISCV_RPMI_SRVGRP_SYSTEM_RESET,
> +        .add =3D riscv_rpmi_sysreset_add,
> +        .remove =3D riscv_rpmi_sysreset_remove,
> +    },
> +};
> +
> +static const RiscvRpmiServiceOps *riscv_rpmi_service_ops_by_group(
> +    uint32_t service_group)
> +{
> +    for (uint32_t i =3D 0; i < ARRAY_SIZE(riscv_rpmi_service_ops); i++) =
{
> +        if (riscv_rpmi_service_ops[i].service_group =3D=3D service_group=
) {
> +            return &riscv_rpmi_service_ops[i];
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
>  static void riscv_rpmi_configure_base(RiscvRpmiState *s,
>                                        const RiscvRpmiConfig *cfg)
>  {
>      s->platform_info =3D g_strdup(cfg->platform_info);
> +    s->machine_ops =3D cfg->machine_ops;
>      s->services =3D cfg->services;
>      s->service_count =3D cfg->service_count;
>
> @@ -211,7 +238,9 @@ static void riscv_rpmi_reset_hold(Object *obj, ResetT=
ype type)
>
>  static void riscv_rpmi_cleanup(RiscvRpmiState *s)
>  {
> -
> +    for (uint32_t i =3D ARRAY_SIZE(riscv_rpmi_service_ops); i > 0; i--) =
{
> +        riscv_rpmi_service_ops[i - 1].remove(s);
> +    }
>
>      if (s->context) {
>          rpmi_context_destroy(s->context);
> @@ -234,12 +263,12 @@ static void riscv_rpmi_cleanup(RiscvRpmiState *s)
>      }
>  }
>
> -bool riscv_rpmi_service_enabled(RiscvRpmiState *s, RiscvRpmiServiceKind =
kind)
> +bool riscv_rpmi_service_enabled(RiscvRpmiState *s, uint32_t service_grou=
p)
>  {
>      uint32_t i;
>
>      for (i =3D 0; i < s->service_count; i++) {
> -        if (s->services[i].kind =3D=3D kind) {
> +        if (s->services[i].service_group =3D=3D service_group) {
>              return true;
>          }
>      }
> @@ -247,6 +276,30 @@ bool riscv_rpmi_service_enabled(RiscvRpmiState *s, R=
iscvRpmiServiceKind kind)
>      return false;
>  }
>
> +bool riscv_rpmi_context_add_group(RiscvRpmiState *s,
> +                                  struct rpmi_service_group *group,
> +                                  const char *name,
> +                                  Error **errp)
> +{
> +    enum rpmi_error rc;
> +
> +    rc =3D rpmi_context_add_group(s->context, group);
> +    if (rc !=3D RPMI_SUCCESS) {
> +        error_setg(errp, "failed to add RPMI %s service group: %d", name=
, rc);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +void riscv_rpmi_context_remove_group(RiscvRpmiState *s,
> +                                     struct rpmi_service_group *group)
> +{
> +    if (s->context && group) {
> +        rpmi_context_remove_group(s->context, group);
> +    }
> +}
> +
>  static bool riscv_rpmi_validate_config(RiscvRpmiState *s, Error **errp)
>  {
>      uint64_t queue_bytes;
> @@ -318,11 +371,16 @@ static bool riscv_rpmi_add_service_group(RiscvRpmiS=
tate *s,
>                                           const RiscvRpmiServiceConfig *s=
ervice,
>                                           Error **errp)
>  {
> -    switch (service->kind) {
> -    default:
> -        error_setg(errp, "unsupported RPMI service kind %d", service->ki=
nd);
> +    const RiscvRpmiServiceOps *ops;
> +
> +    ops =3D riscv_rpmi_service_ops_by_group(service->service_group);
> +    if (!ops) {
> +        error_setg(errp, "unsupported RPMI service group %u",
> +                   service->service_group);
>          return false;
>      }
> +
> +    return ops->add(s, errp);
>  }
>
>  static bool riscv_rpmi_init_services(RiscvRpmiState *s, Error **errp)
> diff --git a/hw/misc/riscv_rpmi_internal.h b/hw/misc/riscv_rpmi_internal.=
h
> index c263033634..ca9838d256 100644
> --- a/hw/misc/riscv_rpmi_internal.h
> +++ b/hw/misc/riscv_rpmi_internal.h
> @@ -18,7 +18,15 @@
>  #define RPMI_PLAT_INFO "QEMU RISC-V RPMI"
>
>  extern const struct rpmi_shmem_platform_ops rpmi_shmem_qemu_ops;
> -bool riscv_rpmi_service_enabled(RiscvRpmiState *s,
> -                                RiscvRpmiServiceKind kind);
> +bool riscv_rpmi_service_enabled(RiscvRpmiState *s, uint32_t service_grou=
p);
> +bool riscv_rpmi_context_add_group(RiscvRpmiState *s,
> +                                  struct rpmi_service_group *group,
> +                                  const char *name,
> +                                  Error **errp);
> +void riscv_rpmi_context_remove_group(RiscvRpmiState *s,
> +                                     struct rpmi_service_group *group);
> +
> +bool riscv_rpmi_sysreset_add(RiscvRpmiState *s, Error **errp);
> +void riscv_rpmi_sysreset_remove(RiscvRpmiState *s);
>
>  #endif
> diff --git a/hw/misc/riscv_rpmi_sysreset.c b/hw/misc/riscv_rpmi_sysreset.=
c
> new file mode 100644
> index 0000000000..775eb5483f
> --- /dev/null
> +++ b/hw/misc/riscv_rpmi_sysreset.c
> @@ -0,0 +1,206 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * RISC-V RPMI System Reset service.
> + *
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + * Author:
> + *  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "riscv_rpmi_internal.h"
> +#include "qemu/log.h"
> +#include "librpmi_env.h"
> +
> +typedef struct RiscvRpmiSysresetType {
> +    uint32_t type;
> +    void (*action)(RiscvRpmiState *s);
> +} RiscvRpmiSysresetType;
> +
> +typedef struct RiscvRpmiSysresetGroup {
> +    struct rpmi_service_group group;
> +    struct rpmi_service services[RPMI_SYSRST_SRV_ID_MAX];
> +    RiscvRpmiState *rpmi;
> +} RiscvRpmiSysresetGroup;
> +
> +static void riscv_rpmi_sysreset_reboot(RiscvRpmiState *s)
> +{
> +    const RiscvRpmiMachineOps *ops =3D s->machine_ops;
> +
> +    if (ops && ops->system_reset) {
> +        ops->system_reset();
> +    }
> +}
> +
> +static void riscv_rpmi_sysreset_shutdown(RiscvRpmiState *s)
> +{
> +    const RiscvRpmiMachineOps *ops =3D s->machine_ops;
> +
> +    if (ops && ops->system_shutdown) {
> +        ops->system_shutdown();
> +    }
> +}
> +
> +static const RiscvRpmiSysresetType riscv_rpmi_sysreset_types[] =3D {
> +    {
> +        .type =3D RPMI_SYSRST_TYPE_SHUTDOWN,
> +        .action =3D riscv_rpmi_sysreset_shutdown,
> +    }, {
> +        .type =3D RPMI_SYSRST_TYPE_COLD_REBOOT,
> +        .action =3D riscv_rpmi_sysreset_reboot,
> +    },
> +};
> +
> +static const RiscvRpmiSysresetType *riscv_rpmi_sysreset_type_by_id(
> +    uint32_t reset_type)
> +{
> +    for (uint32_t index =3D 0; index < ARRAY_SIZE(riscv_rpmi_sysreset_ty=
pes);
> +         index++) {
> +        if (riscv_rpmi_sysreset_types[index].type =3D=3D reset_type) {
> +            return &riscv_rpmi_sysreset_types[index];
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +static void riscv_rpmi_do_system_reset(RiscvRpmiState *s,
> +                                       rpmi_uint32_t reset_type)
> +{
> +    const RiscvRpmiSysresetType *type;
> +
> +    type =3D riscv_rpmi_sysreset_type_by_id(reset_type);
> +    if (type) {
> +        type->action(s);
> +        return;
> +    }
> +
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: unsupported reset type %u\n",
> +                  __func__, reset_type);
> +}
> +
> +static enum rpmi_error riscv_rpmi_sysreset_get_attributes(
> +    struct rpmi_service_group *group, struct rpmi_service *service,
> +    struct rpmi_transport *trans, rpmi_uint16_t request_data_len,
> +    const rpmi_uint8_t *request_data, rpmi_uint16_t *response_data_len,
> +    rpmi_uint8_t *response_data)
> +{
> +    uint32_t reset_type =3D ldl_le_p(request_data);
> +    uint32_t *resp =3D (uint32_t *)response_data;
> +
> +    *response_data_len =3D 2 * sizeof(*resp);
> +    stl_le_p(&resp[0], RPMI_SUCCESS);
> +    stl_le_p(&resp[1], riscv_rpmi_sysreset_type_by_id(reset_type) ?
> +             RPMI_SYSRST_ATTRS_FLAGS_RESETTYPE : 0);
> +
> +    return RPMI_SUCCESS;
> +}
> +
> +static enum rpmi_error riscv_rpmi_sysreset_do_reset(
> +    struct rpmi_service_group *group, struct rpmi_service *service,
> +    struct rpmi_transport *trans, rpmi_uint16_t request_data_len,
> +    const rpmi_uint8_t *request_data, rpmi_uint16_t *response_data_len,
> +    rpmi_uint8_t *response_data)
> +{
> +    RiscvRpmiSysresetGroup *sysreset =3D group->priv;
> +    uint32_t reset_type =3D ldl_le_p(request_data);
> +    uint32_t *resp =3D (uint32_t *)response_data;
> +
> +    *response_data_len =3D sizeof(*resp);
> +
> +    if (!riscv_rpmi_sysreset_type_by_id(reset_type)) {
> +        stl_le_p(resp, (uint32_t)RPMI_ERR_INVALID_PARAM);
> +        return RPMI_SUCCESS;
> +    }
> +
> +    stl_le_p(resp, RPMI_SUCCESS);
> +    riscv_rpmi_do_system_reset(sysreset->rpmi, reset_type);
> +    return RPMI_SUCCESS;
> +}
> +
> +static const struct rpmi_service riscv_rpmi_sysreset_services[] =3D {
> +    [RPMI_SYSRST_SRV_ENABLE_NOTIFICATION] =3D {
> +        .service_id =3D RPMI_SYSRST_SRV_ENABLE_NOTIFICATION,
> +        .min_a2p_request_datalen =3D 8,
> +    },
> +    [RPMI_SYSRST_SRV_GET_ATTRIBUTES] =3D {
> +        .service_id =3D RPMI_SYSRST_SRV_GET_ATTRIBUTES,
> +        .min_a2p_request_datalen =3D 4,
> +        .process_a2p_request =3D riscv_rpmi_sysreset_get_attributes,
> +    },
> +    [RPMI_SYSRST_SRV_SYSTEM_RESET] =3D {
> +        .service_id =3D RPMI_SYSRST_SRV_SYSTEM_RESET,
> +        .min_a2p_request_datalen =3D 4,
> +        .process_a2p_request =3D riscv_rpmi_sysreset_do_reset,
> +    },
> +};
> +
> +static struct rpmi_service_group *riscv_rpmi_sysreset_create(RiscvRpmiSt=
ate *s)
> +{
> +    RiscvRpmiSysresetGroup *sysreset;
> +    struct rpmi_service_group *group;
> +
> +    sysreset =3D g_new0(RiscvRpmiSysresetGroup, 1);
> +    sysreset->rpmi =3D s;
> +    memcpy(sysreset->services, riscv_rpmi_sysreset_services,
> +           sizeof(riscv_rpmi_sysreset_services));
> +
> +    group =3D &sysreset->group;
> +    group->name =3D "sysreset";
> +    group->servicegroup_id =3D RPMI_SRVGRP_SYSTEM_RESET;
> +    group->max_service_id =3D RPMI_SYSRST_SRV_ID_MAX;
> +    group->servicegroup_version =3D
> +        RPMI_BASE_VERSION(RPMI_SPEC_VERSION_MAJOR, RPMI_SPEC_VERSION_MIN=
OR);
> +    group->privilege_level_bitmap =3D RPMI_PRIVILEGE_M_MODE_MASK;
> +    group->services =3D sysreset->services;
> +    group->lock =3D rpmi_env_alloc_lock();
> +    group->priv =3D sysreset;
> +
> +    return group;
> +}
> +
> +static void riscv_rpmi_sysreset_destroy(struct rpmi_service_group *group=
)
> +{
> +    if (!group) {
> +        return;
> +    }
> +
> +    rpmi_env_free_lock(group->lock);
> +    g_free(group->priv);
> +}
> +
> +bool riscv_rpmi_sysreset_add(RiscvRpmiState *s, Error **errp)
> +{
> +    struct rpmi_service_group *group;
> +
> +    if (s->sysreset_group) {
> +        error_setg(errp, "duplicate RPMI sysreset service descriptor");
> +        return false;
> +    }
> +
> +    group =3D riscv_rpmi_sysreset_create(s);
> +    if (!group) {
> +        error_setg(errp, "failed to create RPMI sysreset service group")=
;
> +        return false;
> +    }
> +
> +    if (!riscv_rpmi_context_add_group(s, group, "sysreset", errp)) {
> +        riscv_rpmi_sysreset_destroy(group);
> +        return false;
> +    }
> +
> +    s->sysreset_group =3D group;
> +    return true;
> +}
> +
> +void riscv_rpmi_sysreset_remove(RiscvRpmiState *s)
> +{
> +    if (!s->sysreset_group) {
> +        return;
> +    }
> +
> +    riscv_rpmi_context_remove_group(s, s->sysreset_group);
> +    riscv_rpmi_sysreset_destroy(s->sysreset_group);
> +    s->sysreset_group =3D NULL;
> +}
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index fa0e0db0c3..1a69fd7cfe 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -767,7 +767,8 @@ static void create_fdt_pcie(RISCVVirtState *s,
>      create_pcie_irq_map(s, ms->fdt, name, irq_pcie_phandle);
>  }
>
> -static void create_fdt_reset(RISCVVirtState *s, uint32_t *phandle)
> +static void create_fdt_reset(RISCVVirtState *s, uint32_t *phandle,
> +                             bool use_syscon_reset)
>  {
>      char *name;
>      uint32_t test_phandle;
> @@ -791,6 +792,14 @@ static void create_fdt_reset(RISCVVirtState *s, uint=
32_t *phandle)
>      test_phandle =3D qemu_fdt_get_phandle(ms->fdt, name);
>      g_free(name);
>
> +    /*
> +     * When RPMI is enabled, advertise reset and shutdown through RPMI s=
o
> +     * firmware routes these operations through the RPMI system reset se=
rvice.
> +     */
> +    if (!use_syscon_reset) {
> +        return;
> +    }
> +
>      name =3D g_strdup_printf("/reboot");
>      qemu_fdt_add_subnode(ms->fdt, name);
>      qemu_fdt_setprop_string(ms->fdt, name, "compatible", "syscon-reboot"=
);
> @@ -980,6 +989,34 @@ static void create_fdt_iommu(RISCVVirtState *s, uint=
16_t bdf)
>  }
>
>
> +static const RiscvRpmiServiceConfig virt_rpmi_services[] =3D {
> +    {
> +        .node_name =3D "sysreset",
> +        .compatible =3D "riscv,rpmi-system-reset",
> +        .service_group =3D RISCV_RPMI_SRVGRP_SYSTEM_RESET,
> +    },
> +};
> +
> +static uint32_t virt_rpmi_service_count(RISCVVirtState *s)
> +{
> +    return ARRAY_SIZE(virt_rpmi_services);
> +}
> +
> +static void virt_rpmi_system_reset(void)
> +{
> +    qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +}
> +
> +static void virt_rpmi_system_shutdown(void)
> +{
> +    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +}
> +
> +static const RiscvRpmiMachineOps virt_rpmi_machine_ops =3D {
> +    .system_reset =3D virt_rpmi_system_reset,
> +    .system_shutdown =3D virt_rpmi_system_shutdown,
> +};
> +
>  static RiscvRpmiConfig virt_rpmi_config(RISCVVirtState *s,
>                                          const uint32_t *hart_ids,
>                                          uint32_t hart_count)
> @@ -991,8 +1028,11 @@ static RiscvRpmiConfig virt_rpmi_config(RISCVVirtSt=
ate *s,
>          .a2p_req_size =3D VIRT_RPMI_A2P_REQ_SIZE,
>          .p2a_req_size =3D VIRT_RPMI_P2A_REQ_SIZE,
>          .platform_info =3D "QEMU RISC-V virt RPMI",
> +        .machine_ops =3D &virt_rpmi_machine_ops,
>          .hart_ids =3D hart_ids,
>          .hart_count =3D hart_count,
> +        .services =3D virt_rpmi_services,
> +        .service_count =3D virt_rpmi_service_count(s),
>      };
>  }
>
> @@ -1001,6 +1041,7 @@ static void create_fdt_rpmi(RISCVVirtState *s, uint=
32_t *phandle,
>  {
>      RiscvRpmiConfig rpmi_cfg =3D virt_rpmi_config(s, NULL, 0);
>      uint32_t rpmi_mbox_handle;
> +    uint32_t i;
>      RiscvRpmiFdtMboxConfig cfg =3D {
>          .shmem_base =3D rpmi_cfg.shmem_base,
>          .doorbell_base =3D rpmi_cfg.doorbell_base,
> @@ -1011,6 +1052,12 @@ static void create_fdt_rpmi(RISCVVirtState *s, uin=
t32_t *phandle,
>
>      riscv_rpmi_fdt_add_mbox(MACHINE(s)->fdt, &cfg, phandle,
>                              &rpmi_mbox_handle);
> +
> +    for (i =3D 0; i < rpmi_cfg.service_count; i++) {
> +        riscv_rpmi_fdt_add_service_node(MACHINE(s)->fdt, rpmi_cfg.shmem_=
base,
> +                                        &rpmi_cfg.services[i],
> +                                        rpmi_mbox_handle);
> +    }
>  }
>
>  static void finalize_fdt(RISCVVirtState *s)
> @@ -1036,7 +1083,7 @@ static void finalize_fdt(RISCVVirtState *s)
>          create_fdt_rpmi(s, &phandle, msi_pcie_phandle);
>      }
>
> -    create_fdt_reset(s, &phandle);
> +    create_fdt_reset(s, &phandle, !s->have_rpmi);
>
>      create_fdt_uart(s, irq_mmio_phandle);
>
> diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.h
> index f5fd1ee8c7..a9ccc950e9 100644
> --- a/include/hw/misc/riscv_rpmi.h
> +++ b/include/hw/misc/riscv_rpmi.h
> @@ -27,6 +27,7 @@
>  #define VIRT_RPMI_A2P_REQ_SIZE (16 * RPMI_QUEUE_SLOT_SIZE)
>  #define VIRT_RPMI_P2A_REQ_SIZE 0
>
> +#define RISCV_RPMI_SRVGRP_SYSTEM_RESET   3
>
> Can't we replace the use of these macros with the enum rpmi_servicegroup_=
id for service_group field in struct RiscvRpmiServiceOps so that there is n=
o need to keep adding such #define's for various service groups which essen=
tially have the same values as that in enum rpmi_servicegroup_id for that g=
roup?

yes  local defines duplicate enum rpmi_servicegroup_id, and  the next
version will use librpmi=E2=80=99s enum/values directly.

Thanks
Subbu

>
>  #define TYPE_RISCV_RPMI "riscv-rpmi"
>  OBJECT_DECLARE_SIMPLE_TYPE(RiscvRpmiState, RISCV_RPMI)
> @@ -36,12 +37,11 @@ struct rpmi_service_group;
>  struct rpmi_shmem;
>  struct rpmi_transport;
>
> -typedef enum RiscvRpmiServiceKind {
> -    RISCV_RPMI_SERVICE_INVALID =3D 0,
> -} RiscvRpmiServiceKind;
> -
> +typedef struct RiscvRpmiMachineOps {
> +    void (*system_reset)(void);
> +    void (*system_shutdown)(void);
> +} RiscvRpmiMachineOps;
>  typedef struct RiscvRpmiServiceConfig {
> -    RiscvRpmiServiceKind kind;
>      const char *node_name;
>      const char *compatible;
>      uint32_t service_group;
> @@ -56,7 +56,7 @@ typedef struct RiscvRpmiConfig {
>      uint32_t a2p_req_size;
>      uint32_t p2a_req_size;
>      const char *platform_info;
> -
> +    const RiscvRpmiMachineOps *machine_ops;
>      const uint32_t *hart_ids;
>      uint32_t hart_count;
>      const RiscvRpmiServiceConfig *services;
> @@ -73,7 +73,8 @@ struct RiscvRpmiState {
>      uint32_t a2p_req_size;
>      uint32_t p2a_req_size;
>      char *platform_info;
> -
> +    const RiscvRpmiMachineOps *machine_ops;
> +    struct rpmi_service_group *sysreset_group;
>      uint32_t *hart_ids;
>      uint32_t hart_count;
>      const RiscvRpmiServiceConfig *services;
> diff --git a/include/hw/riscv/rpmi-fdt.h b/include/hw/riscv/rpmi-fdt.h
> index b157bda1d1..60c5df75d0 100644
> --- a/include/hw/riscv/rpmi-fdt.h
> +++ b/include/hw/riscv/rpmi-fdt.h
> @@ -26,5 +26,16 @@ void riscv_rpmi_fdt_add_mbox(void *fdt,
>                               const RiscvRpmiFdtMboxConfig *cfg,
>                               uint32_t *phandle,
>                               uint32_t *mbox_handle);
> +void riscv_rpmi_fdt_add_service(void *fdt, hwaddr shmem_base,
> +                                const char *node_name,
> +                                const char *compatible,
> +                                uint32_t mbox_handle,
> +                                uint32_t service_group,
> +                                bool has_mpxy_channel,
> +                                uint32_t mpxy_channel);
> +
> +void riscv_rpmi_fdt_add_service_node(void *fdt, hwaddr shmem_base,
> +                                     const RiscvRpmiServiceConfig *servi=
ce,
> +                                     uint32_t mbox_handle);
>
>  #endif
> --
> 2.43.0
>
>

