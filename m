Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6093760A2605
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 20:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuc3bKL8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZBFkgSQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQsiz-0000vB-N6; Tue, 10 Nov 2026 15:45:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQsit-0000te-EM
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 15:45:47 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQsin-0006Tr-IW
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 15:45:39 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAJC3VZ708805
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 20:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u9NoxX5cA9OxKTldoj/u/oypO3YbKo8dwc5OByQ79BA=; b=kuc3bKL8hnvOeFEv
 1KeDKkoqWNiwymiepG2MXe3KwkzsNT0D8UaFbWYWLxyeJeQICWhQ/zuaK98foqkt
 Ie4fMLTZfRD/d0fQYS6Ztg5HObd/tx36PidS45Y2NbO5qRXBA/FmMBGeXMjvUyps
 LnCkX0tIi+6frv9N5P/6CeuqvdpC0SpQnM9PlyXsajRPhLCbSVb725lg5z6Y4r+i
 83irwooler7e9WdPViXqwjMP8s8Ha1gn0kDbGomxqb7heIoFVdsLM0Hj/kPjeWAe
 DfINk4oFukB6OGQmRmLaDLIp8DTWvo0rBaIJ4V6fu8aM4V9jibVFog8ocz4ttlEH
 lGHy9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c8c5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 20:45:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91eb3a63064so53077066d6.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 12:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794343531; x=1794948331; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=u9NoxX5cA9OxKTldoj/u/oypO3YbKo8dwc5OByQ79BA=;
 b=XZBFkgSQtLcudKYtPsX0i1XRfj9P/qNyiR9oeaxg2e7EKWb5ZS3Puu3XQ17lhkZCGq
 nGHGnfVamQtKfbzb7q+/Ra1Kzy977F/0+2L2eIw8NvInWTuJrqjNZgWZo3CqIwSZeGjF
 JB52pAj8SBlnrNdzt3vM3SXB3zZFWDjhban3owd7G+dXFP6Hdica7lPOarehf3VjLCIu
 UVeiBp4NBrgoG/gzU0d2L42Q2qJgdkYv9HWK+XAlUEMTyV4P3H/1Sa2sL/eAYA2MoQVo
 gQJlOoo+HZL6wM1PtF4V3nh+nZEK/dvxArAv1KJmAQoaXdbSEg/JOMfWQzUhUgRgSvG1
 8Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794343531; x=1794948331;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u9NoxX5cA9OxKTldoj/u/oypO3YbKo8dwc5OByQ79BA=;
 b=QKgTabhesVzRliwOan+Xy29RAP1SlesDItvzAiGFKjuqcdvbBCtaDG2qCQrQdW4saY
 LU9IRSTGC12bT/OqUtjOTcYN5msC+ukNFhGRVyPephrLTuYIH6DH5raCKqCiUaih3ZQZ
 ENZtiqSOTH5U0JN5X91ewRSyDOnskEmE/3NxHeOz/0BT/7Z2qnIsesGzjZ5goK9SUyh9
 1ZxvmgsLX2HEf1lXFtsU/vQnSP3lKYaq8bfSs1HRHzXcRTTGXG9n0kIYHxHlm9afbku9
 2jkOdBJo5X/ULspzoE0OzMIRrpJfwdoVhAAYhoZSZz+XgZnTz4zfVnA+4V9lsISJSG9U
 lX5A==
X-Forwarded-Encrypted: i=1;
 AL+hErGu1sZsq6N8PwAQSN6+79k7GITwZB7bhX/Cud/gGPmML74tS8Ucqu8Kn7VHeHvY7bpAlHlAVja6G2ld@nongnu.org
X-Gm-Message-State: APuU4Z8mdAXgf/B+XQXhQdgvBPWM87OduK1pIMfqBZTgEqO0ETJ5eGmO
 O2HtBO7+xn4Ea4lPDzoplw+4J4PpCRZ/V899YPKj4Gmbm23HXUCrAgONpI8wS+CkFPwKV5VWS0o
 q1DTaQieqkPqTn5aIPFay8xgmpM2Q2bII/XzSuGKftUFOnyjMbIPWGnqhYbE9JbEO/w==
X-Gm-Gg: AYBFou2mLkPkjHlwbVg9Iepu/JZtmHZzEnmCv14TBUgNx10YI4lGQybP7xoaFDldg/C
 VDkqBPUbzQidFGhHGK+uQZ7IJW+cwCd/y3jlZ4JHPTHzwg14KmJIPF3+bsN8TtwLhc28KSXOCmh
 b1uC5PztP66onnguW4rZ2e2QPeM+XvmG5w6rUEwehzQU66ldPgbMlesui1DhbjB35tFCWHbmGt9
 wZyVd8IuGdS7aMl2rrkicX3pCUqM6qOfWJ7gl1cRB9pAWNiPvsd413UwtzYVYO67kG6+ZRPycaf
 d+8o6qUxRVabkKCVJlCkOvZeFNuE+q6n5JXUR0j61BGfywOaluWKjdNVD9mioMnRt38PfVtLWFt
 QzXQCty1yBbwr76UUOBMTsjECOgdbu9fVjtUaK2TqYB3/TlvO4AeXHEldOJ+nK7cN1kcFJxNrPu
 AyU2x5YbJ2/A==
X-Received: by 2002:ad4:5de2:0:b0:917:b006:50c3 with SMTP id
 6a1803df08f44-91f03fb13b9mr8408366d6.4.1794343531124; 
 Tue, 10 Nov 2026 12:45:31 -0800 (PST)
X-Received: by 2002:ad4:5de2:0:b0:917:b006:50c3 with SMTP id
 6a1803df08f44-91f03fb13b9mr8407766d6.4.1794343530443; 
 Tue, 10 Nov 2026 12:45:30 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f02df0333sm5643126d6.27.2026.11.10.12.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 12:45:29 -0800 (PST)
Message-ID: <e27cd461-8b77-435c-b70a-56ebfe0aaa98@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 17:45:27 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/26] docs/system/riscv: Document Icicle Kit HSS boot
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Conor Dooley <conor@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>, qemu-riscv@nongnu.org
References: <20261104154207.641511-1-bin.meng@processmission.com>
 <20261104154207.641511-23-bin.meng@processmission.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104154207.641511-23-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4MiBTYWx0ZWRfXwteUJJBG2m16
 tyCzTecmunopJ6TjwBBq/2vep+qpKBhUf399lb4q3q2V70aVhQanDAjbNSvflwIKecwXMGgpXQa
 1SqTYtzIlZaI02gFJpos4enmFaeVdhTMkrqyOvg3izcNz8kX/xn7Y1Pp+5naz75SNDwxLHWnNot
 N7O+PJ4TmLoPQCuBZxTCxzKe800Bd5jPGxqee5Nfs9P4vWJySoFja0eBbfSTr+mCUzoQr/aHipB
 P5xLNiivpMNPq4ZZs72ap+2n+n5ssNR80eOXEOSip2YOPHvO66goACHfJUTkSxoBvsre+SLyCur
 RMM2voFE0XuCfCUY9dJxaS9GF1W6sSrasRjZ4uEIqDYPug9eJKT+flXOX/Z4BH9Z/ni6hmMq19i
 BTtfU85bBVfhfp4Y1W+daWCnHbpO1lMk+aHWJ4XlWtxIsmV+nmtH5H03ISLo8qxOxj5z/hrhqms
 gP/TX5j21YHJ6SR8LLg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af3826c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=9cYYqTlEAAAA:20 a=p0WdMEafAAAA:8 a=YRHvXXt1AAAA:8
 a=OGPkCyniAAAA:20 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=BIyTlFAXET60VLmNjCQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=9bw_jnHfPby8klRCszyn:22
 a=H4N_Y-AU75W7NKDNhZlT:22 a=bA3UWDv6hWIuX7UZL3qL:22 a=sJAZaMKuHmt1Z9jkTlw8:22
X-Proofpoint-GUID: BIu-QjaNrUyDO-6t8RuL9LprnlXZzeKu
X-Proofpoint-ORIG-GUID: BIu-QjaNrUyDO-6t8RuL9LprnlXZzeKu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4MiBTYWx0ZWRfXxJiKqxzwzLgr
 bPqx8oL3hOUCsuX2OzATdSZMgGOY/2pC/fWVtXLsHmah6HyZjeuIa1Cex7Sm7Vb1QXw6YShmajR
 LhWpY6VtFJRaqqHXmsKfp1hT2cogCZg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100082
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 12:41 PM, Bin Meng wrote:
> With all previous changes, the Icicle Kit model is now able to boot
> HSS v2026.04.1 through a Buildroot 2026.05 SD image to U-Boot and Linux.
> 
> Document the tested source versions and exact commands to build HSS
> and Buildroot. Include the sparse resize and GPT relocation steps
> needed to make the generated SD image usable by QEMU.
> 
> Explain the pinned firmware baseline and include the DDR pattern-test
> patch used by the versioned test image. Document the tool check needed
> for image-only builds and distinguish the DDR training failure from
> the two investigated multi-hart startup races. Describe their visible
> symptoms, affected source versions, and all three DTB supply paths.
> 
> Also describe the RAM and serial setup, boot stages, and remaining
> model limitations.
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> 
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> 
> (no changes since v4)
> 
> Changes in v4:
> - Use HSS v2026.04.1 and the v1.1.1 test-image recipe
> - Select the SoftConsole toolchain explicitly
> - Use the generated complete boot-mode-1 eNVM binary
> 
> Changes in v3:
> - Include the DDR pattern-test patch used by the functional-test image
> - Document the image-only FPGA programming tool check
> - Describe startup-race symptoms and link the firmware investigations
> 
>   docs/system/riscv/microchip-icicle-kit.rst | 129 ++++++++++++++++++++-
>   1 file changed, 123 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
> index 138289a913..2159e8e461 100644
> --- a/docs/system/riscv/microchip-icicle-kit.rst
> +++ b/docs/system/riscv/microchip-icicle-kit.rst
> @@ -19,12 +19,14 @@ The ``microchip-icicle-kit`` machine supports the following devices:
>   * 4 U54 cores
>   * Core Level Interruptor (CLINT)
>   * Platform-Level Interrupt Controller (PLIC)
> -* L2 Loosely Integrated Memory (L2-LIM)
> +* L2 cache controller, including L2-LIM and L2-Zero windows
>   * DDR memory controller
> +* System controller and system services mailbox
>   * 5 MMUARTs
>   * 1 DMA controller
>   * 2 GEM Ethernet controllers
>   * 1 SDHC storage controller
> +* 1 Real-Time Clock
>   
>   The machine has a fixed 2 GiB of RAM. Other memory sizes are rejected.
>   The machine defaults to all five harts. ``-smp`` may select two to five harts,
> @@ -103,10 +105,125 @@ CAVEATS:
>   Running HSS
>   -----------
>   
> -The machine ``microchip-icicle-kit`` used to run the Hart Software Services
> -(HSS_), however, the HSS development progressed and the QEMU machine
> -implementation lacks behind.  Currently, running the HSS no longer works.
> -There is missing support in the clock and memory controller devices.  In
> -particular, reading from the SD card does not work.
> +The ``microchip-icicle-kit`` machine can boot the Hart Software Services
> +(HSS_), which then loads an HSS payload containing U-Boot from an SD card.
> +The following flow was tested with HSS v2026.04.1 and Buildroot 2026.05.
> +These versions reproduce the firmware and SD card images used by the
> +functional test.
> +
> +Configure HSS for the ``mpfs-icicle-kit-es`` board using its default
> +configuration. QEMU provides the software-visible registers and deterministic
> +status consumed by the HSS v2026.04.1 DDR initialization and training flow;
> +it does not model the electrical properties of DDR training. HSS requires
> +the RISC-V bare-metal toolchain supplied by Microchip SoftConsole to be
> +available in ``PATH``.
> +
> +The versioned test image applies the `DDR pattern-test fix`_ before building
> +HSS. Without this fix, the DDR state machine can reuse uninitialized
> +pattern-test parameters across calls, particularly with the SoftConsole
> +GCC 8.3.0 toolchain. Apply the same patch when reproducing the test image:
> +
> +.. code-block:: bash
> +
> +  $ git clone https://github.com/polarfire-soc/hart-software-services.git
> +  $ cd hart-software-services
> +  $ git checkout v2026.04.1
> +  $ curl -L -o ddr-pattern-test.patch \
> +      https://raw.githubusercontent.com/processmission/qemu-machine-images/v1.1.1/machine/riscv64/microchip-icicle-kit/0001-mpfs_hal-preserve-DDR-pattern-test-parameters.patch
> +  $ git apply ddr-pattern-test.patch
> +  $ cp boards/mpfs-icicle-kit-es/def_config .config
> +  $ echo CONFIG_CC_USE_SOFTCONSOLE=y >> .config
> +  $ FPGENPROG=/bin/true make -j$(nproc) BOARD=mpfs-icicle-kit-es
> +
> +``FPGENPROG=/bin/true`` satisfies the boot-mode programmer's FPGA programming
> +tool check when generating an image for QEMU; no physical device is programmed.
> +
> +The HSS build creates the complete eNVM image, including the 256-byte
> +boot header with the image size and per-hart reset vectors. Copy it to
> +``build/hss.bin`` for the QEMU command below:
> +
> +.. code-block:: bash
> +
> +  $ cp build/bootmode1/hss-envm-wrapper-bm1-p0.bin build/hss.bin
> +
> +Do not pass ``build/hss-envm-wrapper.bin`` directly to QEMU. That file starts
> +at eNVM offset 0x100 and does not contain the boot header with the image size
> +and per-hart reset vectors.
> +
> +Build the SD card image with the tested Buildroot version:
> +
> +.. code-block:: bash
> +
> +  $ git clone https://gitlab.com/buildroot.org/buildroot.git
> +  $ cd buildroot
> +  $ git checkout 2026.05
> +  $ make microchip_mpfs_icicle_defconfig
> +  $ make
> +
> +This produces ``output/images/sdcard.img`` with three GPT partitions:
> +
> +* An HSS ``payload.bin`` containing U-Boot.
> +* A FAT partition containing ``boot.scr`` and the kernel FIT image.
> +* An ext4 Linux root filesystem.
> +
> +The QEMU SD card model requires a power-of-two image size. Make a sparse
> +4 GiB working copy and relocate its backup GPT to the new end of the image:
> +
> +.. code-block:: bash
> +
> +  $ cp --reflink=auto output/images/sdcard.img sdcard.img
> +  $ truncate -s 4G sdcard.img
> +  $ sgdisk -e sdcard.img
> +  $ sgdisk -v sdcard.img
> +
> +The Icicle Kit firmware device tree in the FIT image describes 2 GiB of RAM,
> +matching the machine's fixed RAM size. The command below keeps ``-m 2G``
> +explicit.  Attach the image as an SD card and route both board serial ports:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 \
> +      -M microchip-icicle-kit -smp 5 -m 2G \
> +      -bios path/to/hss/build/hss.bin \
> +      -drive if=sd,file=path/to/sdcard.img,format=raw \
> +      -display none \
> +      -serial file:hss.log \
> +      -serial stdio \
> +      -no-reboot
> +
> +HSS writes to MMUART0, which the command records in ``hss.log``. U-Boot and
> +Linux use MMUART1, which remains connected to the terminal. A successful
> +boot proceeds through HSS payload loading, U-Boot, the Linux kernel, and the
> +login prompt from the root filesystem on the third partition.
> +
> +Known limitations
> +-----------------
> +
> +* Two potential multi-hart startup races were reproduced with HSS v2024.06
> +  under QEMU. The affected code paths are also present in the inspected
> +  HSS v2026.04.1 sources; they have not been reproduced on physical hardware.
> +  See `HSS startup races`_ for the investigation and affected source versions.
> +
> +  * In the eNVM wrapper, a late U54 can clear the decompression completion
> +    flag after E51 has set it. A boot can stop before all harts enter HSS,
> +    with the affected U54s waiting in ``wait_for_decompress_done``.
> +  * After DDR training and payload loading, a U54 other than the configured
> +    payload owner can win the OpenSBI coldboot lottery. With the minimal DTB
> +    describing only ``cpu@1``, U-Boot on another hart can repeatedly print
> +    ``Could not initialize timer (err -19)`` and ``resetting ...``.
> +
> +* Without the DDR pattern-test fix above, some GCC 8.3.0 builds remain at
> +  60% DDR training progress while QEMU keeps running. This is a separate
> +  firmware parameter-lifetime issue; see `DDR pattern-test issue`_.
> +* The SD card model requires the raw image size to be a power of two. Keep
> +  the backup GPT header at the end when resizing the image.
> +* The machine does not generate an Icicle Kit device tree. Firmware boot can
> +  obtain a DTB built into HSS, included in an HSS payload, or supplied by
> +  subsequent software, such as U-Boot or a kernel FIT image. The DTB must
> +  describe the selected hart topology and the modeled reference-design DDR
> +  windows. Direct kernel boot must use ``-dtb`` as described above.
>   
>   .. _HSS: https://github.com/polarfire-soc/hart-software-services
> +.. _DDR pattern-test fix: https://github.com/processmission/qemu-machine-images/blob/v1.1.1/machine/riscv64/microchip-icicle-kit/0001-mpfs_hal-preserve-DDR-pattern-test-parameters.patch
> +.. _DDR pattern-test issue: https://github.com/polarfire-soc/platform/issues/36
> +.. _HSS startup races: https://github.com/polarfire-soc/hart-software-services/issues/106


