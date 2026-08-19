Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A28EC5DF6D
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 04:48:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwYDh-0006LD-OQ; Wed, 19 Aug 2026 00:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wwYDg-0006L0-HL
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 00:48:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wwYDf-0003z7-2h
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 00:48:08 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67J2lXcN3507948
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 04:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 64scJ1fc/xJBOSLi6cTYshkTo+LoalLzTKb8lxfzxRU=; b=bFOLYl7x7Wg8l+w3
 NVEWsdEAIy8Yjuf+NKQB59F9Nep4h/G6ZLpx7vV9qbgNe7Ce0VBloQWf+Xt+1edT
 XIhwMZ1PmJZQBAf2KpFMT/5b+LCYaPESBNH+B2KV8WuApShH3DTPI3Mpe6+mQPJN
 NEaF15/oJ6tVFUDlv5yWkBT5IW6v4Po8J3eUtxWri8GW3gTCJrLR5VV+BqtVU8JZ
 8QBp3WDZOZfnvPzfw/akJjuhgqVLaL2Qq08keVBoLh21vFZTLkEIt1C2P41XJh8E
 c7JbXKbNSWghP/XtIjKD227dxzv7A3azlyXi4ec+oK/AiOhDYBfYDcHaD+QIc566
 tEaPjw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm9b9g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 04:48:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-73761f92dd1so6661137.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 21:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787114885; cv=none;
 d=google.com; s=arc-20260327;
 b=ZXs8PvgUr0LhAzHI+xEvRvhmRbMPW/fOmqU9/HoiLuFcY8+s8Xmf39DIun1DdVBWd4
 PKs4uw5mduSV/Qr+0n+iQ5cdcegyuHW/knAfmi3TKhI3EKoog+hBfWt8u4D+8kG1Jk8s
 SSQkk6Kuve0jkWCd3WQhtMViR1JQ0I8HwHjSMdPSU40sDMA9AAF7VwNipw5qQ1UQACY7
 +Muxzi9oE92ad8+vE2EB763ZDmiaqITVGqm/CUq4G0gLM2OAZl5lRVQGHbkBEwmbRUtZ
 iaaDES+MxIvGQ6qEFp4QVseU6N6QCy+eRZGBwnNtaIRMUh6LPDAzD1uvn6vXnMZoB7Lc
 EA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=64scJ1fc/xJBOSLi6cTYshkTo+LoalLzTKb8lxfzxRU=;
 fh=9ly/5zZ6pZywwxLbPaOabLbUGbpb2NvuUNVnRUNDAw4=;
 b=nk6llLqm7RSmiAkECbsyxElLKgZSr4JEntxY1f9fHffOLnrVWzzJIHuUe79WBuJMvZ
 +gLhwwoSi08qJekIU8y94vsmmJqIBHxWAtnZZ00naC5Bl+Ey/Ne+0ruvBeo2FU+tLxS/
 x9F2x2A75vfrHYoDfUl5JrmDC1cHAjaogQmzMZKd9hNagOCIKpZn6C9Tzera9wJZlazr
 Y7emD0mZQS8Zpc66+MgH4ToMuOPFXca3UMsAmt/nE7BUNfbySVoSU+SPQViftJMEvGDk
 Y5D0OOjPWKswBKR3g40TqkUV/80+hvueLa/JzqGvWgABbGuT1Rw4snnPcAEy5ji7iqrz
 6uUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787114885; x=1787719685; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=64scJ1fc/xJBOSLi6cTYshkTo+LoalLzTKb8lxfzxRU=;
 b=ROAJYV4Lx4svT9qW+U3CKBsCH1dCRRMIfvOlhjfyfbGA42sesBXAF5Hj673KUbog68
 6WuWeIw/lHmcvBCp9rQKIavuL9bTxsbpM0dYiYd9X1eLfL75z175jtLhGW3cOyIMo+Fq
 94AZyYjmRnHcN/7YrRHmpbZeORY9stqLxFK72Xo/YToIG40nR79T+vCNtz1UlqPOjcXw
 fzaVJtwOTUluSpTlLmt4tSgzXCOcSmw0HxIV2BDFdEc4hyizuIX5q0lxSmZ0GJu8rZaV
 +CKYLLXOxmOWWtv/BZ9M2g89fzNoxneX9iAyzKAkguCUd0p0FnBHVjIPrUKWYi9tzatW
 SQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787114885; x=1787719685;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=64scJ1fc/xJBOSLi6cTYshkTo+LoalLzTKb8lxfzxRU=;
 b=ktXQ9slNya/KslJt7SMBvHyulrYHrs5MGgSU1xbvW967vhCRkjlh6D0zwPqqfsmQ3n
 BRx0TRLZGq9YD6DfVWsb8ZLb3yBv9bjuw76ifFJHdNAMdnkVNpRYBg/h3NSUT1tTQRko
 FVkztTNq+9C3y5fPINOlh6fYZuttXbGB149WQopjcMExgDDlcaP5y242ZHoXir9VAOMB
 evdCMh22Dp062xgjiw6JxTo7INjyd07nHfanZouIfeqRZ9JP5PIwB2M8/Oj5DxRO6YFC
 M6frjVIXzCkAl4PDhN5aw3CiCbo26Y65hbh+4kW3qduIH8lq9+QP1bIlvNqTzd8LlmTY
 63kA==
X-Gm-Message-State: AOJu0YwUeDxFzlchNKtgkUGtOZAix0JOmuCNJQ1XxEhzP8mYNUX324f3
 mcLAKEcqBGsgO6XGt92TGZi+VUmL7HIx4AapFpqLbYMxcgooF6gmTdf3mOaTai+w/4g1+por7MI
 bZMkoy6YiTGTNsbxZ80CF8y6PiGaAcICWhpzvWTKZfY7QzbmQi8QMycf2f6IstQJd4vvbL5akSj
 P69i/W6gGn+xDosZNvz3ZoYB3inRLe6N8o
X-Gm-Gg: AR+sD12iYw8q3CXt80fN7y6+NjLUf5X6QRKrsxNoTizoiy6sd50hm6PR9c5a7rIQyx7
 2+6krw3AasawEjBHyORxBCYkUA0RDdgm2Etm/WZ7RIBl2+TDXUOirvWmnDIrGUOkoQmPMOUYNt2
 4OVBA7g8Z7OjsjX1MjVYgVVPu66fs/1WKHfGt1xsoh5HhbtLx2Z8dMsCJvvx4=
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id
 ada2fe7eead31-777faba447cmr188605137.1.1787114880387; 
 Tue, 18 Aug 2026 21:48:00 -0700 (PDT)
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id
 ada2fe7eead31-777faba447cmr188592137.1.1787114879990; Tue, 18 Aug 2026
 21:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260814045315.3416169-5-subrahmanya.lingappa@oss.qualcomm.com>
 <CAB19ukGHNA7KwDpgeucPoy0h2OThHGL7LqESDeY8f_moxPGyUQ@mail.gmail.com>
In-Reply-To: <CAB19ukGHNA7KwDpgeucPoy0h2OThHGL7LqESDeY8f_moxPGyUQ@mail.gmail.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 10:17:49 +0530
X-Gm-Features: AcwNN1WurUbtvHsXOe7_ghZyear-8vUGiyeWd-Uroi8UDPl2GPRI1P9LvazQZTw
Message-ID: <CAPxK-6dwyzkCV8VUTD+dyMqKd0WeAPB6E4zh2w5dEGGFJudVrg@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/riscv/virt: add opt-in RPMI base support
To: sunilvl@oss.qualcomm.com
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 2DXK6VHMSCpCTn4zp0N9eEqT4Dj-LGcm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzMyBTYWx0ZWRfX2heY0Y7nTwpB
 SUMXJDYMtPVBXsJV9pUT0hObGd8sUoznB6wYDEYy14YtNNXeHFZbTVkEJe0+sW7MlXlXOfqkXqX
 iJE2n7ArDu3GPAGHGCL0n5f+a+qHmC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzMyBTYWx0ZWRfX8hZJo4vIJyev
 8lKXraG+D/OF0yKCsKi647aEM+mPb1psIKUxfMXTRB/THY5G2DaDV1epA34+EEC+yhWjHby4UTY
 HmcM5PS4aFaA3TewCe5s2RWMIRoopoQ3+RNDlN2Lq2yZWpF83R+VlnJTCPBV/hR4Kwa6YxKZYCi
 wdzhjY+kY4YQ1oCJ10l6dgRvfbxaIDOGhR8cccGFSpSeLthOzYvOSWikdwR5vvz9eE41ix0ah3V
 NJRqL/k0cfXLqOdinEtBCSHm4EExGaTS80erwI3ZKH7fPvEkpHhYpSlkI0k6xhhg4af0YvmuSgQ
 fhuRacZ1nZPEY4D3CONCbxLZHTZTr3ENF9/l1VVfEiMK5F7sSzjnp90C0CyfqZWGrkyJocZ7815
 KbsFO+di6MR4Pc/XwSbEQeArdVhrs5p4X6Xrq4wrvBVamL3e9TrbHwU7QDyYNg/HPcIx2uxlnq7
 0Pn8uBpVhrMSE6UsorQ==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a853586 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Ak59p1GQuooY577Z0c0A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 2DXK6VHMSCpCTn4zp0N9eEqT4Dj-LGcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
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

Sunil,

On Mon, Aug 17, 2026 at 2:07=E2=80=AFPM Sunil V L <sunilvl@oss.qualcomm.com=
> wrote:
>
> On Fri, Aug 14, 2026 at 10:25=E2=80=AFAM Subrahmanya Lingappa
> <subrahmanya.lingappa@oss.qualcomm.com> wrote:
> >
> > Add the virt machine rpmi=3Don/off option and wire the initial RPMI Bas=
e
> > transport into machine realization.
> >
> > The option remains disabled by default and requires TCG plus librpmi.
> > Invalid accelerator/build combinations fail during machine
> > initialization. When enabled, virt allocates the RPMI shared-memory
> > transport, creates the RPMI device, configures Base service metadata,
> > and emits the corresponding device-tree nodes for firmware discovery.
> >
> > Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.=
com>
> > ---
> >  hw/misc/meson.build       |  2 +-
> >  hw/misc/riscv_rpmi-stub.c | 16 +++++++
> >  hw/riscv/Kconfig          |  1 +
> >  hw/riscv/meson.build      |  4 +-
> >  hw/riscv/rpmi-fdt-stub.c  | 37 +++++++++++++++
> >  hw/riscv/virt.c           | 96 +++++++++++++++++++++++++++++++++++++++
> >  include/hw/riscv/virt.h   |  3 ++
> >  7 files changed, 157 insertions(+), 2 deletions(-)
> >  create mode 100644 hw/misc/riscv_rpmi-stub.c
> >  create mode 100644 hw/riscv/rpmi-fdt-stub.c
> >
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index e7c2ebe28f..92c9cd6064 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -170,4 +170,4 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: fil=
es('sbsa_ec.c'))
> >  system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
> >  system_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: [files(
> >    'riscv_rpmi.c',
> > -), librpmi])
> > +), librpmi], if_false: files('riscv_rpmi-stub.c'))
> > diff --git a/hw/misc/riscv_rpmi-stub.c b/hw/misc/riscv_rpmi-stub.c
> > new file mode 100644
> > index 0000000000..dc32b43227
> > --- /dev/null
> > +++ b/hw/misc/riscv_rpmi-stub.c
> > @@ -0,0 +1,16 @@
> > +/*
> > + * RISC-V RPMI stubs.
> >
> Shouldn't these changes which are outside of the virt, be in a separate p=
atch?
>
  Agreed. I will move the generic RPMI stubs out of the virt machine patch:
  riscv_rpmi-stub.c will be introduced with the RPMI misc/framework support=
,
  and rpmi-fdt-stub.c will be introduced with the RPMI FDT helper patch.

Thanks,

> Thanks,
> Sunil

