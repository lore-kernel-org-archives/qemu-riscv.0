Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9842AC4451C
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 13:27:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkiaj-0000y9-PD; Fri, 17 Jul 2026 09:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkiag-0000tY-QA
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 09:26:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkiae-0007Du-Uh
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 09:26:58 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HCSvm21654095
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 13:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +0YU1T0vWzgT8jlDIM8QTFYOwuPUiM0KOIQe0NdqIQU=; b=XWS/GdFXewkWeWcn
 phT8t+EfRidhNbseOorg56BtiHYD/w38xyQkGR24wKV7amdc2QrOneo9kZ79gKB/
 oOQJbCv3jK36pzHF/+32yX1pJEEv6uWxPiTAf/MaPpACGF24SO4H+I7wgOFFOkUR
 fZgOnH7lr7gvAE5u6KQxOyBek/j9RH3Y6daAMt/5k2W6J+LevU6xBp8NqO70ordz
 PsFTELOIhiOOTq36KqBs1S4LP/bNWaVJlsLP3WUFoe5AN2npz3wGi2pCFXs6feO9
 3WTAV0tXZsyD0SbqNhzKb3j06YVHJlwP/EOnS207AeNWbwMRvXNjItOU4kD6Id/5
 AKgJcQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p9gc6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 13:26:55 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-7fe835353acso64028747b3.2
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 06:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784294815; x=1784899615; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+0YU1T0vWzgT8jlDIM8QTFYOwuPUiM0KOIQe0NdqIQU=;
 b=Zi2fWshzucRGvmV9HtAonCF5bIzbXzDs6XXqFpr7TbhnMFbFSwRo5kRykRS5ijCj91
 dZnmZ+CRJd/dFSoF8+1GeYKFslIf+MB4HvicyF1kncJi+EvRYE8GD6s+8Ud56bI+H5+B
 yRDvKjFiMJN4gpx0jOhJjdUN2MyGG/1GfgiP4kOhfXgeRLwyNWrwa8mjaJ1+SQz4qfHD
 /x9ILavUAiHN3oxw9QI75H3Tm3V4hnJ+SdT/qo+hzEukGXmFqLwbe8UKOo6E3m82+8ZX
 JYYsgUdUW3eVBcP9B0jmhG29kI2fQiZkCtDc6iQm6Nz2iGZ7tOXuVFO8G1tzlU1H2/ke
 WLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784294815; x=1784899615;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+0YU1T0vWzgT8jlDIM8QTFYOwuPUiM0KOIQe0NdqIQU=;
 b=o2EVdqGb9HJ+07KRucEMvSqCPvf7SVaSLptQCWb0OUVj4Odqkddk3g8Lt+JhLkPjX7
 B4OSaL5MIFE90/Prm7I89AcAXf9N9rIpAXYN0rh24i94iWNnUtMky2DqPF9hH1rhrr/P
 C7z3qV8uw6qlDvikAcqTHOv5E1ffwYRi09bCXuOCZq3fFK7jz4+/Ox/D/hIY3tz1Nmbg
 0AiulKBU5qDcfJK55RaNCHq+ANQgHYwYOcShcsQInWRj8ibGzTkTY8nONlZGQbILIK4f
 nz3uTY2OWviILvNTGnEaP7yMdxNfnSlM67o2AsVWj3KXkHDo9oS6X8oIvt9MQy36SgIF
 f71Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2RF6/0Fbb6VH9e+LratZyb/fcjj2LcS+ImI3OPyYLygsxU+yX7ecYgxYi90hTDWvPmNa7PMd8DY8+@nongnu.org
X-Gm-Message-State: AOJu0Yy2Vubm+PTglvUDZ4v6m2cocVsT4fldIK/uS5euGZbjKX+y3dwa
 RuDzOH8gYEWXK8QON3QNipG5FliTgUO0UeAzEveIvnAuTR34MTE/G6NbH9elkqm7gHTaa/2wYTi
 tDTNSLtFSM+9EKkAex0ElaliHa0dX+PwAv6e0/5Tc3HTZOp50iBu7dOcTuYA7/u2U2w==
X-Gm-Gg: AfdE7cmpuAm0+UjNiii0aKReAAE4gV19LzahmL0pWeuxE2ZFgRQglvh4q5Pe2wiAv3p
 AIZ6wddSLGsLEDi9pevBZQylyA+JOMHeYxrbWG1vYCMgLbii2GS9K0X4jl7LjH29rS0ByFPmsAX
 o5J53XbokAPDaOBtVU1V2rdZQ6/cVM1wK4X7wJhNjxboRsjLBezpgZRB4idW/xC98gXEAERMKS0
 nH1r/lbeNVOCCTSyB5SGzlXwd2kBRqGN3JMVPc0WgDu01+C/EyQ/txNW4uQ736hJrfZjTui4Ep5
 8XaSFLoRPGeEOaWJhtR1yA5Hshs7d+nPch/39egq4jbIGlMEdOHGZFA7WyyCuyE+KSIH+Bm1k0E
 bSXCB3lwTCc2S77RD11ulGTn7kDy//LKk30lSGg==
X-Received: by 2002:a05:690e:4399:b0:667:a683:9990 with SMTP id
 956f58d0204a3-6683bd4eb7emr524359d50.78.1784294815362; 
 Fri, 17 Jul 2026 06:26:55 -0700 (PDT)
X-Received: by 2002:a05:690e:4399:b0:667:a683:9990 with SMTP id
 956f58d0204a3-6683bd4eb7emr524348d50.78.1784294814763; 
 Fri, 17 Jul 2026 06:26:54 -0700 (PDT)
Received: from [192.168.68.105] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6683b80eb54sm1333142d50.13.2026.07.17.06.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2026 06:26:54 -0700 (PDT)
Message-ID: <8e5b44e3-9054-4e81-ab76-89d853221299@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:26:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] docs/system/riscv: document initial virt RPMI
 support
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260714075659.2258023-9-subrahmanya.lingappa@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260714075659.2258023-9-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _A2lnKfrL9Dr0zXrz1lEZ8PgCkOGreQr
X-Proofpoint-ORIG-GUID: _A2lnKfrL9Dr0zXrz1lEZ8PgCkOGreQr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzNiBTYWx0ZWRfX5eYjPwWMEH/k
 aoqXfw1wKjqNgZvJzPrNukzQPFfh7hBzcLyAmdSrhp+slpFED+8vyHI3B5g55fuH0gMcuI8jdqb
 Qzkq7KnatWqMCpnvFMfmDdLED8k8bGjX5mXQZOac07hIO50A4Em12gp7J+qI71uAVLij01Ldo3X
 6FvUI8UAJNuDOUGMmZAhCHttAIvZreqVxGFpiXLMiz6CRB627xubfcz2FpQzveaWCizHNcVrVFn
 Zxh6KsEGuH3nA9F6NLcZcIAcvwVylIxgBqEyDqVLhUdxs2dxXJGQFj9t9eot9CHAcrB4/bbNN3S
 ikansf/J0CeETmaCtLLsx6bv7j5NINn0lJ0jC2mHPJMAhyxGh1mLWWwlhbiMP6Hi8mFgJPHoMeg
 /rrCKUAMM4odYcpoWIGrcKHd9yefUsXkyIFTysm2/9qPRtELtY1xECdwxC5DKeU53gp6piIyeHj
 YyrwAo5+YHCFYTjjxXQ==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a2d9f cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=xqlBBKlOt2JiA3_xaBgA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzNiBTYWx0ZWRfX23+MVJAfK9kg
 tFlNebeNrfuubUXWA+uMkNu8SYbBztdsSAHIvpvFBFMZuUAT7OwUN2fOv2jDJYWShUY4LW9XKL4
 VkzL4fztmzDdCpbXC31r7BeAQnJcAjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170136
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/14/2026 4:56 AM, Subrahmanya Lingappa wrote:
> Document the opt-in virt RPMI transport and the initial HSM, system
> reset, and system suspend service groups.
> 
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   docs/system/riscv/virt.rst | 65 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
> 
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index 60850970ce..31cd945a3b 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -146,6 +146,71 @@ The following machine-specific options are supported:
>   
>     Enables the riscv-iommu-sys platform device. Defaults to 'off'.
>   
> +- rpmi=[on|off]
> +
> +  Enables the RISC-V RPMI shared-memory transport. This option defaults to
> +  "off", is TCG-only, and is available only when QEMU is built with librpmi
> +  support. This support targets the RISC-V Platform Management Interface
> +  (RPMI) Specification v1.0 Ratified (`RPMI v1.0 specification`_). The initial
> +  ``virt`` implementation exposes RPMI system reset, system suspend, and HSM
> +  service groups. System reset can request shutdown or cold reboot through
> +  RPMI. HSM uses the ``virt`` hart IDs and supports hart discovery, status,
> +  start, stop, and suspend commands. System suspend uses QEMU's suspend and
> +  wakeup path. Migration is currently blocked while RPMI transport and service
> +  VMState support is being designed.
> +
> +  The build dependency is provided by `librpmi`_. QEMU requires librpmi 1.0.0
> +  or newer. If the host distribution does not provide a librpmi development
> +  package, build and install it from the upstream source tree so that
> +  ``pkg-config`` can find ``librpmi.pc``:
> +
> +  .. code-block:: bash
> +
> +    $ git clone https://github.com/riscv-software-src/librpmi.git
> +    $ cd librpmi
> +    $ make
> +    $ make install I=/usr/local
> +    $ export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
> +    $ pkg-config --modversion librpmi
> +
> +  The librpmi repository can also generate installable ``librpmi-dev`` Debian
> +  packages with ``make deb-pkg`` and ``librpmi-devel`` RPM packages with
> +  ``make rpm-pkg``. After installing librpmi, configure QEMU with
> +  ``--enable-librpmi`` or ``-Dlibrpmi=enabled``.
> +
> +.. _RPMI v1.0 specification: https://github.com/riscv-non-isa/riscv-rpmi/releases/download/v1.0/riscv-rpmi.pdf
> +.. _librpmi: https://github.com/riscv-software-src/librpmi
> +
> +RPMI firmware and guest smoke
> +-----------------------------
> +
> +A firmware-level RPMI smoke test can be run with OpenSBI, a Linux kernel, and a
> +RISC-V disk image:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 \
> +      -machine virt,rpmi=on \
> +      -cpu rv64 -smp 4 -m 4G -nographic \
> +      -bios /path/to/fw_jump.bin \
> +      -kernel /path/to/Image \
> +      -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
> +      -drive file=/path/to/rootfs.img,format=raw,if=virtio,snapshot=on
> +
> +The OpenSBI banner should report RPMI-backed HSM and system suspend support.
> +After the guest reaches a shell, normal guest reboot/poweroff commands exercise
> +the RPMI system reset path.
> +
> +RPMI device tree policy
> +-----------------------
> +
> +RPMI is currently described through FDT only; no ACPI representation is emitted
> +for the RPMI transport or service groups. The ``virt`` machine uses the
> +``riscv,rpmi-shmem-mbox`` shared-memory mailbox node plus child service nodes
> +with ``riscv,rpmi-*`` compatible strings. These binding names are part of the
> +RPMI RFC surface and may be revised if the RISC-V RPMI bindings change during
> +review.
> +
>   Running Linux kernel
>   --------------------
>   


