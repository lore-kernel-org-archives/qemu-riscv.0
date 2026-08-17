Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B63C5DF70
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 08:37:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvsqc-0005Yz-EZ; Mon, 17 Aug 2026 04:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1wvsqb-0005VX-03
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 04:37:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1wvsqY-0005LG-9o
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 04:37:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67H6xUvR662884
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 08:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=lxtxCOms/qw4ckxVhbvPV81LeBCTu10QqoCU1NXaTQQ=; b=U1
 tsot9kLH0mzbBEYBEW5mkzPYg5DE60s/jboeF/uXqmdsFFrH7Zd9fbrG4DZKb9Kr
 UwHiW38ZS7o72VAwD9SFDovhlxRjfD0KWr/VUFW1qEjy36MCdqJQ78SpEfWcIi7b
 Klqld5ObVrnAsAuAEet7GHrZ8IXNRqrOdPJspIfWDvLrqXwOXdJ8ju+2+580JOZq
 4Afxo3XCTcj7weEIXcXAtfWFfJ5De2sHx9l7fIRQweh3rbvSbKwIi8xc9wcSpeqi
 yNGKN7/0WvCpiU44SFipjdp4ukMWDBpsjAAGSvAWvBt3GTz5NSxIwnN9kvDiiygu
 adHEa7+nuS5QKPd+GN4A==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghnx2w7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 08:37:28 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-66aafa833c0so2135308d50.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 01:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786955848; cv=none;
 d=google.com; s=arc-20260327;
 b=P4qnIQaVcF49wmcEnrTjuOKxD1CnHysSoey9YEuoUO2DVrMvuK9tR7IajpJS97c/My
 dlhZO0esYXn7XTC3OEt4HIlmPOdcEUpHPeId4YQ5IToCcK0clT9dP6Zl5sOi0P9IBqVy
 EmHvlz8P8ktKAuz+NfifIvdvIYBeJbeb0I/m+T9PocKhy/3wCN+0TF4Ve2NOGXQvFgOe
 qmunmxvm2O4R1MPBtDefPNr5v0bHQ9aL7ulQuOUYgBPdUpcjfWE6y1zqHwGJinRuvvTe
 oiGDJVSoy5MXI34NE0u8eQUjCyETQBnSc6BIGVGw/417ovItF9/4Rg5zf4e5VwaGwwZo
 Z6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=lxtxCOms/qw4ckxVhbvPV81LeBCTu10QqoCU1NXaTQQ=;
 fh=JnFJ9N86FH+ABoNA3ZlHTREDZX2wTVYx2/ROJ9erA6o=;
 b=YA71VwXZ7VcfQ7PO2QJeXyGNkGVu+2gf/o4fCfurfrkfL7o9hBIuafAIRlWYCIoz9O
 5Ux77ieCol3PjF/EDSjWSskR69wKIsJRTxPPAmaON0kEza+TZHsBM9nNvhRhwQ8jXtpj
 PgDS+uLvb1ZoOaRHS+6c8NITKNAxFjrITWm6ApWkordMTfkoi5TtouStO5YZ0ik/15WN
 A6YLQvJMcig8YIY4tMPU+ACMUdlWb5RYSolvGunR59WGKX6YbG+Rp13eqx1kH37OexPX
 8N+Gmlt4LIwSxDzQMVF0dtdAJEE93D+v2ZeHfE92/Jvff6PSMdx6X0pwr6fKXeCh9fo6
 q+qw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786955848; x=1787560648; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=lxtxCOms/qw4ckxVhbvPV81LeBCTu10QqoCU1NXaTQQ=;
 b=GxSn+Hr6ITuEPpgfrCrwzyjyAZcWXa0zlCanksQbH/at+/PnFFY7ggiGxs/C6qPLPW
 YJZku+tB05ApbV1pfSerDytux2dospeuysxGNjYbCVYL9YePAZ8UY6JT/GfQfvMghrre
 5T/H1z4k4+WNdTK72rPIQK/gq9WC3rUUAzsEBOag8XLX0+D2ZHu7jKOFmZ8ApeNAeGQT
 Pri5RdLOeU7DFWsmriR0HXYDLb/TZBR2c+ffxdZXfGT+R3CX9kkj364oFarhRunjC6Nn
 vyQi5l5aX5V+vpMZ761OiePqZtAjiVWQHLXy4bqdbRP8fO9ZN03uSV8SA8qqd/8IF7l8
 U26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786955848; x=1787560648;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lxtxCOms/qw4ckxVhbvPV81LeBCTu10QqoCU1NXaTQQ=;
 b=dq2285aJOmtkpjwrz9sNtXkABlGGP6QWqvm3W85bJ9wWIpOo+OCWRryvEOvSPV45ek
 FH2FGfdeMCRMwu2uzSLQBmE9fDIZkc/YdHII1wzZXYyaQGqMdTOwmb5vLpU9cO1xnVIK
 IstdqBWwezAe/YecCDPNzDzOw0HRuixdBwfXJM+C8Ilm3m6wf5vCBxwX+XlTaBgLAwKA
 YvDychOeXu6Ay6OJZpanZiaTqTMAO45lK4hOR8RgGZdeiTFV/KGtplYURnw8T+C8HYaw
 loYjPctQoKKY551v00rJzYu50DZhWX+a5uYsqDYUsVPMxjKaVF21Nq7jr6gkFepW9x+R
 +kNA==
X-Gm-Message-State: AOJu0YwhuZqcPP6Hgu0j2gOlEG7zukZ/KyT1SnONtHc8sURqokcRv5el
 WzKyv0kGw4hIkvC+0fGQtrLgvZfCHXvVQ1uspftx/x3t+SXW5hvqKe7+wDUTV7emLFsOD4HzvbK
 Z+hWy0WdyO5xHcSe+4wv1M2RpsIDCPKTHNiMsE6+flk9/pD4MuzNpOSPqKVnrlAZ9iKUEYRQUFH
 yEmC+RMNFTEptXxLYg+9+s8WmGnLO4FDtT
X-Gm-Gg: AR+sD12tkvFr+kEYnOV2MnwNYYgp6iSk/+cEQeqJJNYAVYdo09vESjJuN5JzCr0+DxH
 WwiMdJL6IEMgUg42bSBg/lVoEUjI/GHz7iZCIoxIT7hbuJvofc40WfHF5FIifuABQCE6TdxeZ0e
 trqUm27E1Mp+5bU8YaKvmd2e5BI08u83th0Nma5F0/g9NVE3nXMvA7fz9fkBc=
X-Received: by 2002:a05:690e:169a:b0:667:e04a:8a42 with SMTP id
 956f58d0204a3-66c72d0449cmr8634675d50.46.1786955847684; 
 Mon, 17 Aug 2026 01:37:27 -0700 (PDT)
X-Received: by 2002:a05:690e:169a:b0:667:e04a:8a42 with SMTP id
 956f58d0204a3-66c72d0449cmr8634663d50.46.1786955847336; Mon, 17 Aug 2026
 01:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260814045315.3416169-5-subrahmanya.lingappa@oss.qualcomm.com>
In-Reply-To: <20260814045315.3416169-5-subrahmanya.lingappa@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:07:15 +0530
X-Gm-Features: AcwNN1WLKMQAnaxCiqTkvSkvqRqJyAj8ou0hWj5nypmLFHzPHFDs5efWjE2LKws
Message-ID: <CAB19ukGHNA7KwDpgeucPoy0h2OThHGL7LqESDeY8f_moxPGyUQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/riscv/virt: add opt-in RPMI base support
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NCBTYWx0ZWRfX0M9J8FWiyjoq
 naUck9zNbZ1f51IPUaUdAe806dqOcybwAlZQ2y7q6qxlpPcHZwjKAI+SSJ4eG8KtQaKa0YFh5M8
 3I0vH+3lrg/zIPoDapZPIJQTFOaDentVkHiyYBpG4UFGpus2WT1zOITL2NTh7hX2PaY4WUcmJhQ
 1uAe45i7CXWkjtgMVLJ8xucadsU89IUJhxCfzK6zvMrwA41gFipkEtFRmXhtgblz4e2c1olnOYW
 eH0qh+3NHYROSDGLcJgWZeu9Xu/K5nfKMcUOVMYgneUBd5pnfEAsbeglk5zpCg8UfSeNXsomNAe
 mPif8hnZ9KzeeJmQi9VFz5H2jG0UFnpUbwJMIU3WsF8IAQh8qhWHuLmFNI+rxaZHcf2nzeJJGC7
 jKSDpmRsgWn7UZJHeQv6ncS0/v3WEvBla8oPMjGymLrrn8vjgOZ9FNbhUWpQ6Sy9TOKXAKOxWFn
 bUIFNhdsgbDYCLS4nzQ==
X-Proofpoint-ORIG-GUID: cSEPfkT3gbWnOF46IMw1tzRZbXMBioXE
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a82c848 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=JmizWh1dmgbBdfpdsmoA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NCBTYWx0ZWRfX6HPPSzo5nvVH
 qdx7BpjxxTvWda7+PT736NHks+jn3zgLU/BinD6uEueCfk0JZ5Oep/NvJs+weSD7oW+60JyagDQ
 m/pQ/A85R60oI0/bJUG7oJsUbaeOshM=
X-Proofpoint-GUID: cSEPfkT3gbWnOF46IMw1tzRZbXMBioXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170064
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
> Add the virt machine rpmi=3Don/off option and wire the initial RPMI Base
> transport into machine realization.
>
> The option remains disabled by default and requires TCG plus librpmi.
> Invalid accelerator/build combinations fail during machine
> initialization. When enabled, virt allocates the RPMI shared-memory
> transport, creates the RPMI device, configures Base service metadata,
> and emits the corresponding device-tree nodes for firmware discovery.
>
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.co=
m>
> ---
>  hw/misc/meson.build       |  2 +-
>  hw/misc/riscv_rpmi-stub.c | 16 +++++++
>  hw/riscv/Kconfig          |  1 +
>  hw/riscv/meson.build      |  4 +-
>  hw/riscv/rpmi-fdt-stub.c  | 37 +++++++++++++++
>  hw/riscv/virt.c           | 96 +++++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h   |  3 ++
>  7 files changed, 157 insertions(+), 2 deletions(-)
>  create mode 100644 hw/misc/riscv_rpmi-stub.c
>  create mode 100644 hw/riscv/rpmi-fdt-stub.c
>
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index e7c2ebe28f..92c9cd6064 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -170,4 +170,4 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files=
('sbsa_ec.c'))
>  system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
>  system_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: [files(
>    'riscv_rpmi.c',
> -), librpmi])
> +), librpmi], if_false: files('riscv_rpmi-stub.c'))
> diff --git a/hw/misc/riscv_rpmi-stub.c b/hw/misc/riscv_rpmi-stub.c
> new file mode 100644
> index 0000000000..dc32b43227
> --- /dev/null
> +++ b/hw/misc/riscv_rpmi-stub.c
> @@ -0,0 +1,16 @@
> +/*
> + * RISC-V RPMI stubs.
>
Shouldn't these changes which are outside of the virt, be in a separate pat=
ch?

Thanks,
Sunil

