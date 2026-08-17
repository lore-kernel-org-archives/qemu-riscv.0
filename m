Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F262DC5CFC1
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 06:54:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvrEb-00013y-1g; Mon, 17 Aug 2026 02:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1wvrEJ-000115-Pr
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 02:53:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1wvrEH-0000fg-Ji
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 02:53:55 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GLCPOV662711
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 06:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=z5KWKAmpRJ1Jz+1cwswSIDuuFIZQq3GVGapkto4O9F8=; b=bP
 1eNb88/5k+aZxnMjpTKdxAQXDinzzY5WHEdnrJoglRShuc1EzB2VCEm+LHFtjzY5
 d+NB98r4LVcrHPHVdUVtdlMq59RONyWPeGQEqjmW9FE3XaI9/kPkxagK/d7pnShF
 yu24SjlUBvgfL/7mFSgiyicCT8MvTf0PaVEGKjATmvcVsrFvMsmsuvGyxq9JoJ4B
 yWAbylFxkcTRFQyteUFC42NCr6rQb0Ph14tqqARoibhL+RpSdhhcXhP9xS0EGDFz
 Tb8o+50ClQ8AbtP8LVxHZlYBnR4xgc+LdPAusJHZEq4SxOUi9DFCMix2sHjNQA7o
 G8s/3HkKAnKDglVMmRNQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghnwm0j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 06:53:49 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-66964c24996so11438651d50.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 23:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786949629; cv=none;
 d=google.com; s=arc-20260327;
 b=N8lu4qV/JZT/KdybqZMcYFSsXq/zri4RWyxzxgftkNSweOb5wafjKLfKYNXxNaHFvW
 UWCa0w1b2YaXuntoUY9gefHtKBYz5n1/s5JwoN16b119NVqSeH24pv0mAKOK4N5RPwjz
 hh+NDCSMAyuQi4urW9khjcXTEZdDllc+0jpqc+UwD/2PSEolpsrIY8GevzvZcbbEgFt9
 gw3YqEb0zslKpTVFHzVtyQbMspuPZU8UUHn3aMxPyaPgV98LDrJAQjrNoyR+fjq2JX5p
 Va/MEJohYDr4kiYtf428H7Gneep3e+yZ55G8aJR6CDIfogzyJ+nGkorfMHXYUXuqYw41
 JX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=z5KWKAmpRJ1Jz+1cwswSIDuuFIZQq3GVGapkto4O9F8=;
 fh=Ly45iLLkRcnQE6u2kH3HWBY1gSykY8eSiq7gd1Rb1WI=;
 b=XUL/qzAGFrrnskaKFz+MWpVFHmbNahRpL0OWawWq6ddO8S9oC3hrufPg8iLvqvbilo
 wVAoD/bQ+nBNI6nxyiG0MssUze2Z8gilKnTv/XIQz2Y8zV0qKzFP2nglsk6b5yMHnC2t
 QN0ugSRP349MNH95iQ2wFz1S/ZG5MBzyZLdLCQOmSLXwFGiQAg2qTDTLyikVYJ83YTuJ
 ayVA3qMcY/cGByIfFCEpfGCV6nmMWFWxIV0kzu93Ou0kHhGnW97my4+Ub0vKlPLg7fo/
 C/GTByz1wpXC3ouD4UKzMjOqBhU2fNC/05n46E6//CCy8yKS+0JEM62udPOFacSqQCTc
 BFMQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786949629; x=1787554429; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=z5KWKAmpRJ1Jz+1cwswSIDuuFIZQq3GVGapkto4O9F8=;
 b=K0sHwbzoiJmmoFi+YIYBR826aqi13Zn62wKBaup3lkHdid+TeX66HMVsUqaTjU7HOt
 NntvsKXasNfsYv+tW6aF9i2MIYIRkMrpDC9wW0wsPUf6nZoKpbAGHn77O6ISVzybAbIM
 FFDp3/ckVjru5arjkgaLCUoFcrdwUcuvVcujSGzs6EKevDWP++O7TF2MiF4iyFUwaV11
 sWD/gcUPOWjZSa8CIxnNFrTSGzHBKKav1926Y+MSwgt3qu/C2OpfFBAQq+DLVHB5ZWgX
 WDSuZHG6LwUxgBC8rP9Zf1f5sBPh2NrKvI+RXADPZSFi/jil0WXMuN03vi0w2Ed9oH53
 7nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786949629; x=1787554429;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=z5KWKAmpRJ1Jz+1cwswSIDuuFIZQq3GVGapkto4O9F8=;
 b=sdK1oO0QelC1clP0Z/gTYiij2hXW2z61dfg4HL2pT5VKWEwKd5VDsoMAN5Mx4Lc/uI
 7G49pdJLr3dUwfcf+gv0Jjf6JvKT3m4sWfUAQF6S6LGeMefll90NbDzHIEUJMzeJCXQr
 GCHrnDTLeYmGd7hxpxGjtSJkUPA2BBQlFlZJMJU/HdCz+ROIjyaVbPGPXvs2xtBptI6m
 EPViHVmhv3XTLrmuNWftucWiUwr0co7rxgjvBQrUN1Y+sz+ZggUZSn9Xsv/eqkZYrPw4
 bmBQevGdwx+5umvGAL89rlPqOYqJTdV8LX0n5R2CNsG6OgR2jV6qDPF7nJpm/bHRyWgP
 e6Hw==
X-Gm-Message-State: AOJu0YzfPqUJcfvKHrE06a5kisA3xd+ig2flog9iNNWFXw3IdFZ0oyPf
 CQyRJTPZfLvu3P2/6pe/aSfjHL3Z2S2k1CGYlM/LxBwX8fWXXg6x1NfMHBoJxcrk2qsrrg1koJR
 9PNr0dhFWDrSIoPLU/Vk5Fk0Rxf3ZEvIBDEXLVU5ORm6hLKhevoHNTem557WDqTLcwNevkVPPgC
 6bOUhwhvgwre4d/IvkQwn89fPCZ7HgxgNx
X-Gm-Gg: AR+sD10wzfnJAB4uJdiR+Tx3DPwuHEc5PPOWbrcGlMpYeErqzQoGs0AwvYtOLoTkWn1
 xnZOXRjAXZB/sYqEDEohi1QXC3dgu/B4NyktueUg7xUDGYBAKCmMBBnXtKdNyrPyWtZi8Vh2XVI
 rN1bPJLe5Ufc1tsNmuv/CAp+iW58dKIG71tVD/cA6zndwemncXNQ3zHrMYBk0=
X-Received: by 2002:a53:ac9e:0:b0:66c:51c5:61de with SMTP id
 956f58d0204a3-66c72b1a1aamr8207683d50.1.1786949629262; 
 Sun, 16 Aug 2026 23:53:49 -0700 (PDT)
X-Received: by 2002:a53:ac9e:0:b0:66c:51c5:61de with SMTP id
 956f58d0204a3-66c72b1a1aamr8207667d50.1.1786949628811; Sun, 16 Aug 2026
 23:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260814045315.3416169-3-subrahmanya.lingappa@oss.qualcomm.com>
In-Reply-To: <20260814045315.3416169-3-subrahmanya.lingappa@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 12:23:36 +0530
X-Gm-Features: AcwNN1U4R8FdQMlXQBQcZGFS6wc8H5O9cUZK-V3z0PUW54Bb84C3x5D6NZkD_AE
Message-ID: <CAB19ukFjhg9HEbKKBH1+i8pkLnC4wEH3zGyXhHcTbBLdgFJgTQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] hw/misc: add RISC-V RPMI transport and Base
 support
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1MCBTYWx0ZWRfXzlQzUdvP7hV6
 OkG1fER8yj41BFHxHoj1XJTE9ovhOJZcu/PuOoaIKALmJzGgmeJWgJhLiGrGgrkCn2r0ybxJTQR
 H/PUCUPSS9/FMDjWXMaOXKlUvR1x9eiAlKbEyipm55oB3qxTopVYKBVvS0I5Kgphho7gIOejwp/
 AzYHmo3qrvOAHT5uqxB4TiEtSqv8PVGwI1wsw8YQsYo0vX8UWRfs17T+w3OZ8M8mn0dcdiz5x/1
 aflZ/NmrkrBpvwii9O9jCckCA8CcJGSa1lQXQBM4jrmt+T7Wt/rlP3k2oH3Y/TiZK4POT62lBlI
 LawEgccGIA9oVHsrsxunivIvXOF7kiKXydo7KyLFRZt+dfsLJ5lvD8PoTyst68ljtm6/n2wUhbI
 n8nzLm6+7XQlR3Y/Ohfut6FNRpPE2YN+q+96XDp4IFOGsLihz810Z0YD2DJo6vvgdRw3r27PmP+
 6+ylwlqGbFc5hJjlF4A==
X-Proofpoint-ORIG-GUID: tQ9WvOOs9w50Ogq8wYKvgiRwvwQ9LBOB
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a82affd cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=V1jnuoLLAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=Mqtt7XXVeWGkBcWUv6AA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1MCBTYWx0ZWRfXwVAozbLTbZ44
 c4PwIz7CKofw9sZntdaU/H3TSIQ+4X+qKTVqytunvKEV2vqXF2XzSWCOmnJvgsD8jVsW6UxCvkw
 KhxPQwlbALrEbiWamS+uv1Mk5XrGryE=
X-Proofpoint-GUID: tQ9WvOOs9w50Ogq8wYKvgiRwvwQ9LBOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170050
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Aug 14, 2026 at 10:25=E2=80=AFAM Subrahmanya Lingappa
<subrahmanya.lingappa@oss.qualcomm.com> wrote:
>
> RPMI (RISC-V Platform Management Interface) is the RISC-V non-ISA
> platform management specification. It defines a shared-memory transport,
> message protocol, and service groups for platform management.
>
> Add the QEMU transport backend and Base service plumbing for virt using
> librpmi.
>
> This implementation targets the RISC-V Platform Management Interface
> (RPMI) Specification v1.0 Ratified:
>
> https://github.com/riscv-non-isa/riscv-rpmi/releases/download/v1.0/riscv-=
rpmi.pdf
>
> The librpmi backend is maintained at:
>
> https://github.com/riscv-software-src/librpmi
>
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.co=
m>
> ---
>  MAINTAINERS                   |   2 +
>  hw/misc/Kconfig               |   4 +
>  hw/misc/meson.build           |   3 +
>  hw/misc/riscv_rpmi.c          | 477 ++++++++++++++++++++++++++++++++++
>  hw/misc/riscv_rpmi_internal.h |  24 ++
>  include/hw/misc/riscv_rpmi.h  |  90 +++++++
>  6 files changed, 600 insertions(+)
>  create mode 100644 hw/misc/riscv_rpmi.c
>  create mode 100644 hw/misc/riscv_rpmi_internal.h
>  create mode 100644 include/hw/misc/riscv_rpmi.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93df53d87f..8e91a31757 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -359,6 +359,8 @@ F: target/riscv/
>  F: hw/char/riscv_htif.c
>  F: hw/riscv/
>  F: hw/intc/riscv*
> +F: hw/misc/riscv_rpmi*
> +F: include/hw/misc/riscv_rpmi.h
>  F: include/hw/char/riscv_htif.h
>  F: include/hw/riscv/
>  F: common-user/host/riscv*
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 1543ee6653..998944c342 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -258,3 +258,7 @@ config XLNX_ZYNQ_DDRC
>      bool
>
>  source macio/Kconfig
> +
> +config RISCV_RPMI
> +    bool
> +    depends on LIBRPMI
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 23265f6035..e7c2ebe28f 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -168,3 +168,6 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files=
('sbsa_ec.c'))
>
>  # HPPA devices
>  system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
>
NIT: A blank line here would be better.

> +system_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: [files(
> +  'riscv_rpmi.c',
> +), librpmi])
> diff --git a/hw/misc/riscv_rpmi.c b/hw/misc/riscv_rpmi.c
> new file mode 100644
> index 0000000000..54a790fc7c
> --- /dev/null
> +++ b/hw/misc/riscv_rpmi.c
> @@ -0,0 +1,477 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * RISC-V RPMI transport device.
> + *
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + * Author:
> + *  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "exec/cpu-common.h"
> +#include "hw/core/qdev-properties.h"
> +#include "hw/misc/riscv_rpmi.h"
> +#include "hw/misc/riscv_rpmi_internal.h"
> +#include "migration/vmstate.h"
> +#include "system/address-spaces.h"
> +#include "system/runstate.h"
> +#include "librpmi.h"
> +#include "librpmi_env.h"
> +
> +void *rpmi_env_zalloc(rpmi_size_t size)
> +{
> +    return g_malloc0(size);
> +}
> +
> +void rpmi_env_free(void *ptr)
> +{
> +    g_free(ptr);
> +}
> +
> +void rpmi_env_writel(rpmi_uint64_t addr, rpmi_uint32_t val)
> +{
> +    cpu_physical_memory_write(addr, &val, sizeof(val));
> +}
>
These cpu_physical_memory_*() interfaces are renamed, right?

Thanks,
Sunil

