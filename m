Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F485606A321
	for <qemu-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RsyzfMMu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXojnv2E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xN7rf-0002RT-SF; Sat, 31 Oct 2026 08:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prajwal.n@oss.qualcomm.com>)
 id 1xN7rd-0002QG-39
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 08:07:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prajwal.n@oss.qualcomm.com>)
 id 1xN7rZ-0002Yp-NB
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 08:07:11 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69V4e1tE3761262
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 12:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SCjlrXyH0yzBzM31vNqgQ7O6dlAFop/LD2KCMUAKndU=; b=RsyzfMMuD4MxY/1o
 XBYNVX5UFr4iwyGRJREdbWGyJ/sM+Gk+RInl8z7JWd6USuG+PDnemlyXzTUQRGSP
 vreNYysmyTJ1yunu1s3ka3/6dchkIKlt3Ea3A/ddK5snK45yc4rp92qIIjdFwZvs
 mnMNb61tOamkz8uplibFhNbtgLXEuWiqYcn40XHWSySR1XuvSSZGzEU7yu2c8fji
 GfP1JsI4iinH5iP6Qa/J0mpYTfoDFaNsRjgGZbxWo93Dgh3mW9gHJz5MJAJd4wkE
 /fZvRvYZA2xarHaoNatfgHsVCUAGP3sEyBnTFvPyaZ/OFVIxlI4iY8GYkCeOiIpT
 J3UAdw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk0v13-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 12:07:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cd67466211bso852237a12.1
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 05:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793448421; cv=none;
 d=google.com; s=arc-20260327;
 b=Xzeo0UG2p/eXlzIeBlpURpZ5WISPoz6HtrgkGk8fO1G2hxe/IKb3OCBW1iqRpl2PZ3
 Uh09yjGZ3fvusLN2dfTLXwonwrQ6Rp2FtLqpbB9eF92sCGuw2/fItNqY+JEcyyCceuOn
 vTP4aWgVU4gYFwVcUKyoeLePZPZjK2a7lR9A3Kg0mDmCkxxhRZ56LB4Z/SiCjwYi9sG2
 ty8DfOBDdJvm/j4Qde17PZ262X0eGNK3m0i+GPrl2P/wQLmVY+GeSq0LysQM5MXAP3S/
 Y2ByjXvgK2Q4UZdBxn0SOzCIHuXuUi8ageIl98SNWpKkk5meWb3r8qanmrQ4BUyYV8UQ
 rBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SCjlrXyH0yzBzM31vNqgQ7O6dlAFop/LD2KCMUAKndU=;
 fh=7NroOdtdUI5guvajmmAjwtd2z4Tr7ZKRHf20BPB0nMQ=;
 b=MZUb/Hre7AoTY0r8XKnkvn/x3ZEuK5d5+zR2hPVr1CXe6fREwNtNJMVeOI/jyFy8jZ
 I9GyOR1rykVb9KeFd1gP2IYxLJ3YNxJ3/d1dNUdHxUf6Lt5vsOskCf2EAe1Gjr4H1RTq
 WQHh0TQ1U3W9XfRBcUTlyTAXlF2dJDxsJRWLNlnKop/vHYu8xyy130r/agQX0UZphgmm
 rWy/H8xJL1sbsojmEWHOQDGXZ27l8o/QvnHCsJlGszrom11cqqFghgW4F71pgKiCGgF6
 JOyJKbMt5t/pBg1ktcF+TpT/XirQJDpvhkx1aletttYQ8hKpQYxkPsiSFpUFO26STFCD
 WhqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793448421; x=1794053221; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SCjlrXyH0yzBzM31vNqgQ7O6dlAFop/LD2KCMUAKndU=;
 b=BXojnv2EZ2FRC+KYwTSgmOPmht7pZKmPAha4ynlYQBDAQX6dOurulz2TQlK2sSe97Y
 rLnH4Cc2dunZD5rM90a0/g2vVNZq3n4tbsm3HQIPtaeGETlg2/vVEMb6uTsyCUjBn4MA
 jhf3hKxkftGgQTKLRb1CifqPF1HucvUCrLhRx4vqCv8KhfV6nCAezfSYdxJu7WabLM1j
 38tsibqoTLSjlNE54vYmECxzThmF2tx5LNi/APRMMAsJt+czh9IRKhexh8XUPnEPKrkN
 wGea9qiuaXHtXyUvIJSY+OS3+3rGnomFZlCkC4ZU01d1kvjzA7eaDzkVp3FhXDNLvykr
 Di8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793448421; x=1794053221;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SCjlrXyH0yzBzM31vNqgQ7O6dlAFop/LD2KCMUAKndU=;
 b=gtyKp+sWcPCZTPd+GwXym2xFRvt+BJyi2wrPMyRg6MezD+2xjhu3Tb5ZIyiDV656FS
 Gter7+REvN55UC8zGkRJbqqsJafb2NmgnS8wlAkhlJeuZ+l3lAZsCwiFQgSHozSiSgzc
 QpO6ZOkYb4aYV4ShdD5gPkkST15YK1vaggIz0rijtwqLTc8oj+bVdXM23HQHiVkKYL91
 qqM6I2vz9Us3RuAW0cs84XReqhz+UJKFLkkUL2Ch5y7blEjFWk/7k+2eCtQSIYsUGl/V
 0VVZUlUKQyK6Oc79yKmRQfRgZkOksuzeXMZrvhcUWDMO+sfwa3A2WY1q+ZCEOtCR/u2Q
 OB4g==
X-Forwarded-Encrypted: i=1;
 AKwUvByCnOsakgUjj9kou0dCBlMVKe7RKxW3jIdnHtJZuOMz+0b1DfzwYnXXYXW6aWEbubSDn9hItqf8IiKP@nongnu.org
X-Gm-Message-State: AFq9FYKUzyuj5LtK60SS42Q0YZOfLVpz7TrhgGICxnHCYm+8LdXAKMWJ
 33gz8dPVj6CDznZ7+2gU+kjZe4msM6dFv9CMrcE6F7MlS5ISP+SW9/f0nj895KRAHIlXxkK/1Sw
 quuxmdBKDgzEMW8/Pw61wlHD7wsHqAtvGmEApzOgU/WOWsMg9J3XWcjkuAF5CIVy1FKCtWsJc6O
 78SBDmsfiyEYjPXBmHLBGL/7n56GyzzZW+
X-Gm-Gg: AYBFou32fYK4mzY0DU6nHe2GuOvzMcACZqegx7xeDAkgUQhHFHPBGD4PLw22byGuqjH
 bH00tmU6hoEgDMioNMxb/lyyXci4s95j+HgmKf3H2tT8okrWpVeMA+GXJMlsTIVWyvsKxPvZ/np
 eapg6r71ENXnap8Y7Mvi0QVN9pytzIZauVOnUAaeudo+iRkPHGLIl5nNAFMQ==
X-Received: by 2002:a17:902:d60e:b0:2e9:56a4:8571 with SMTP id
 d9443c01a7336-2eb364b8ca1mr51842665ad.25.1793448420593; 
 Sat, 31 Oct 2026 05:07:00 -0700 (PDT)
X-Received: by 2002:a17:902:d60e:b0:2e9:56a4:8571 with SMTP id
 d9443c01a7336-2eb364b8ca1mr51842325ad.25.1793448420094; Sat, 31 Oct 2026
 05:07:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026-riscv-ssqosid-cbqri-v6-0-1a367a35cd0e@kernel.org>
 <20261026-riscv-ssqosid-cbqri-v6-3-1a367a35cd0e@kernel.org>
 <b789deea-1d49-4d3e-8203-58ff42fcb930@oss.qualcomm.com>
 <auPa8dDH6tj8nZfH@thelio>
In-Reply-To: <auPa8dDH6tj8nZfH@thelio>
From: Prajwal N <prajwal.n@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 17:36:49 +0530
X-Gm-Features: AclHuK-wbx1IUspnw6MoH9QTLEJESqRB2OrwzwadoAkNYoMKR4VeReDj4ChEdOY
Message-ID: <CACksjdgm8q+V1r6OatCvYfrbbs16LMF_db3rpq-bBcbfrU1ygA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] hw/riscv: implement CBQRI capacity controller
To: Drew Fustini <fustini@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicolas Pitre <npitre@baylibre.com>,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
 Atish Patra <atish.patra@linux.dev>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
 yunhui cui <cuiyunhui@bytedance.com>,
 Chen Pei <cp0613@linux.alibaba.com>, guo.wenjia23@zte.com.cn,
 liu.qingtao2@zte.com.cn, prajwal.n.oss@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: vll0J2rB0M6bI1YCAhMS_grdQKRTA4NW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OCBTYWx0ZWRfXyH/YFJBn9dVC
 t8btDBW+hp05B7SYeIQVY5N8KIkCFDNsRIfQ4mChye13l1B5tWDojp8znqQfKKmLKGfKje0+LlZ
 fwawGpOJx2DfALBi0QpQU2MsCgqR2NhIN7FqJEsbscgEr37vMn5M5qxF8Hiu+moaschZvmgavsx
 jqQpa6bfWCAxI3fSqcBFc6Bqt7ac5E1x9gXQyxhW6/UAOUElopHl3FqE5tVJbjHRp/FcNMYfwm2
 g7rNd0QdqwyEMbETX8jpty6fk6WYoMxv9UzS0eL/hqON0Ape+24CnmxZu5TGdmE6oFTJDPzZSxf
 u3PH7xKO1z3o77Pehg5854T9Q6iqIyL1tqJlebHnLFukx2V1QYPtPIyvTxP/Do89b6tgh18zSNI
 r05FI4z1KGh37R476xEmBoDYjvZT2LSRIbSv2IelutteqZ+ns4v1RZsV4Ij42l9XMaSDTk3o/iw
 6kQGhQZexLv7IJTd1QA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5d9ea cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=V1jnuoLLAAAA:20 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=EUspDBNiAAAA:8 a=69wJf7TsAAAA:8 a=nLUjKXqvyLKcHEmclVoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=IawgGOuG5U0WyFbmm1f5:22 a=Fg1AiH1G6rFz08G2ETeA:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OCBTYWx0ZWRfX6yFD7qCkj0TB
 JKKwjiU/r/mBGudCkVxi3f5V7n1wrBYRuJJ9SwYaCPbravWQ5ZYq445dPzfW5f3NdMqg600lnJh
 bGPZc/uBu7aaE4sG2p8AMB9SMDpi5mQ=
X-Proofpoint-ORIG-GUID: vll0J2rB0M6bI1YCAhMS_grdQKRTA4NW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310048
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=prajwal.n@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for pointing that out. I checked the v6 series on virt machine.
LGTM.

Thanks,
Prajwal

On Fri, Oct 30, 2026 at 5:17=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Wed, Oct 28, 2026 at 07:02:32PM +0530, Prajwal N wrote:
> > Hi Drew,
> >
> > On 26-10-2026 23:17, Drew Fustini wrote:
> > > From: Nicolas Pitre <npitre@baylibre.com>
> > >
> > > Implement a capacity controller according to the Capacity and Bandwid=
th
> > > QoS Register Interface (CBQRI) which supports these capabilities:
> > >
> > >   - Number of access types: 2 (code and data)
> > >   - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
> > >   - Event IDs supported: None, Occupancy
> > >   - Capacity allocation ops: CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID
> > >
> > > Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> > > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > > [fustini: add fields introduced in the ratified spec: cunits, rpfx, p=
]
> > > Reviewed-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.c=
om>
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > >  MAINTAINERS               |   1 +
> > >  hw/riscv/cbqri_capacity.c | 727 ++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  2 files changed, 728 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 2984779ce43a..f230cdbbe1b8 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -408,6 +408,7 @@ M: Nicolas Pitre <npitre@baylibre.com>
> > >  M: Drew Fustini <fustini@kernel.org>
> > >  L: qemu-riscv@nongnu.org
> > >  S: Supported
> > > +F: hw/riscv/cbqri_capacity.c
> > >  F: include/hw/riscv/cbqri.h
> > >
> > >  RISC-V SiFive (Xsf*) extensions
> > > diff --git a/hw/riscv/cbqri_capacity.c b/hw/riscv/cbqri_capacity.c
> > > new file mode 100644
> > > index 000000000000..7ea20532b950
> > > --- /dev/null
> > > +++ b/hw/riscv/cbqri_capacity.c
> > > @@ -0,0 +1,727 @@
> > > +/*
> > > + * RISC-V Capacity and Bandwidth QoS Register Interface
> > > + * URL: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1=
.0
> > > + *
> > > + * Copyright (c) 2023 BayLibre SAS
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + *
> > > + * This file contains the Capacity-controller QoS Register Interface=
.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qapi/error.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qemu/log.h"
> > > +#include "qemu/module.h"
> > > +#include "qemu/bitmap.h"
> > > +#include "hw/core/qdev-properties.h"
> > > +#include "hw/core/sysbus.h"
> > > +#include "target/riscv/cpu.h"
> > > +#include "hw/riscv/cbqri.h"
> >
> > [...]
> >
> > > +static void riscv_cbqri_cc_write(void *opaque, hwaddr addr,
> > > +                                 uint64_t value, unsigned size)
> > > +{
> > > +    RiscvCbqriCapacityState *cc =3D opaque;
> > > +
> > > +    assert((addr % 8) =3D=3D 0);
> > > +
> > The same comments in the riscv_cbqri_cc_read() below are applicable
> > here as well.
> >
> > > +    switch (addr) {
> > > +    case A_CC_CAPABILITIES:
> > > +        /* read-only register */
> > > +        break;
> > > +    case A_CC_MON_CTL:
> > > +        riscv_cbqri_cc_write_mon_ctl(cc, value);
> > > +        break;
> > > +    case A_CC_ALLOC_CTL:
> > > +        riscv_cbqri_cc_write_alloc_ctl(cc, value);
> > > +        break;
> > > +    case A_CC_MON_CTR_VAL:
> > > +        /* read-only register */
> > > +        break;
> > > +    case A_CC_BLOCK_MASK:
> > > +        if (cc->ncblks =3D=3D 0) {
> > > +            break;
> > > +        }
> > > +        /* fallthrough */
> > > +    default:
> > > +        uint32_t blkmask_slot =3D (addr - A_CC_BLOCK_MASK) / 8;
> > > +        if (blkmask_slot =3D=3D get_slots(cc)) {
> > > +            /* this is cc_cunits register */
> > > +            break;
> > > +        } else if (blkmask_slot > get_slots(cc)) {
> > > +            qemu_log_mask(LOG_GUEST_ERROR,
> > > +                          "%s: out of bounds (addr=3D0x%x)",
> > > +                          __func__, (uint32_t)addr);
> > > +            break;
> > > +        }
> > > +        cc->alloc_blockmasks[blkmask_slot] =3D value;
> > > +    }
> > > +}
> > > +
> > > +static uint64_t riscv_cbqri_cc_read(void *opaque, hwaddr addr, unsig=
ned size)
> > > +{
> > > +    RiscvCbqriCapacityState *cc =3D opaque;
> > > +    uint64_t value =3D 0;
> > > +
> > > +    assert((addr % 8) =3D=3D 0);
> > > +
> > To access the 64 bit CBQRI register, the Linux kernel is performing two
> > 32 bit reads. The register offsets that are passed to this function are=
 0x00,
> > 0x04, 0x08 ... The assert is triggered for the addr 0x04, 0x0c.. and th=
e
> > QEMU exists.
> > This check should have been:
> > assert((addr %4) =3D=3D 0)
> >
> > The switch statement uses the register offsets that are 8-byte aligned.
> > A_CC_CAPABILITIES (0x00), A_CC_MON_CTL (0x08) etc.
> > Since the kernel invokes read twice, the second readl() has the offset =
addr
> > 0x04. This does not match any offset and falls into the default case.
> > The following change fixes the problem.
> >
> >        hwaddr reg_addr =3D addr & ~7ULL; /* align down to 8-byte bounda=
ry */> +    switch (addr) {
> >        switch (reg_addr) {> +    case A_CC_CAPABILITIES:
> > > +        value =3D FIELD_DP64(value, CC_CAPABILITIES, VER_MAJOR,
> > > +                           RISCV_CBQRI_VERSION_MAJOR);
> > > +        value =3D FIELD_DP64(value, CC_CAPABILITIES, VER_MINOR,
> > > +                           RISCV_CBQRI_VERSION_MINOR);
> > > +        value =3D FIELD_DP64(value, CC_CAPABILITIES, NCBLKS,
> > > +                           cc->ncblks);
> > > +        value =3D FIELD_DP64(value, CC_CAPABILITIES, FRCID,
> > > +                           cc->supports_alloc_op_flush_rcid);
> > > +        value =3D FIELD_DP64(value, CC_CAPABILITIES, CUNITS, 0);
> > > +        value =3D FIELD_DP64(value, CC_CAPABILITIES, RPFX, 0);
> > > +        value =3D FIELD_DP64(value, CC_CAPABILITIES, P, 0);
> > > +        break;
> > > +    case A_CC_MON_CTL:
> > > +        value =3D cc->cc_mon_ctl;
> > > +        break;
> > > +    case A_CC_ALLOC_CTL:
> > > +        value =3D cc->cc_alloc_ctl;
> > > +        break;
> > > +    case A_CC_MON_CTR_VAL:
> > > +        value =3D cc->cc_mon_ctr_val;
> > > +        break;
> > > +    case A_CC_BLOCK_MASK:
> > > +        if (cc->ncblks =3D=3D 0) {
> > > +            break;
> > > +        }
> > > +        /* fallthrough */
> > > +    default:
> > > +        unsigned int blkmask_slot =3D (addr - A_CC_BLOCK_MASK) / 8;
> > > +        if (blkmask_slot =3D=3D get_slots(cc)) {
> > > +            /*
> > > +             * The cc_cunits register is always the slot following t=
he
> > > +             * last slot of cc_blockmask register. Capacity units ar=
e
> > > +             * not supported by this implementation so must return 0=
.
> > > +             */
> > > +            value =3D 0;
> > > +            break;
> > > +        } else if (blkmask_slot > get_slots(cc)) {
> > > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: out of bounds (addr=
=3D0x%x)",
> > > +                          __func__, (uint32_t)addr);
> > > +            break;
> > > +        }
> > > +        value =3D cc->alloc_blockmasks[blkmask_slot];
> > > +    }
> > > +
> > The logic within the switch statement always computes the full 64-bit r=
egister
> > value. But the Linux kernel requested for 32 bits. The kernel is creati=
ng a
> > 64-bit value with the two 32-bit values. This should return only the re=
levant half.
> > The following code snippet fixed the problem.
> >     /* Return the correct 32-bit */
> >     if (size =3D=3D 4) {
> >         if (addr & 4)
> >             return value >> 32;   // high word
> >         else
> >             return value & 0xffffffff;  // low word
> >     }
> >
> > Thanks,
> > Prajwal N
>
> Thank you for reviewing. Did you see that riscv_cbqri_cc_ops actually
> invokes riscv_cbqri_cc_read_wrapper() and
> riscv_cbqri_cc_write_wrapper()?
>
> Those wrappers were added in v5 based on Radim's feedback on v4.
>
> Thanks,
> Drew

