Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1958CC79F82
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 10:06:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3siQ-0002Pa-3l; Tue, 08 Sep 2026 06:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1x3siO-0002PC-Sr
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 06:06:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1x3siJ-0006fT-6r
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 06:06:08 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6888cFLS2380728
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 10:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XDuazRtZb7js9s2s9w00zibO
 jPpf7qRhb7cOuOybBl0=; b=Izg/2hfivbf4+fgSkpZyoEKEI6+tsoFknHb4tqBw
 gZxuYo45Sms6U3lF5FY5TeTVuFr96LQ8zAE1b24h1Cj+Sl8HVHAgi036uHn5fNXb
 7AlA5Cl+aba4qJqX00jKh7eT1GJMYZhBwCf4wBHuv9/CD13fI3kQ5rrdX+VAE82l
 Wu9PPMrOEZfSthHcFPHplpK5AZ5uzvg3uVJ8JiM6ZoJ2A5weLKVaM43rK8GoreCZ
 Dj5fe3rvGakXYN7Kaq36yJarZWmtKCmu7yWg8B42MlTtMRL19YCxDJLNul/wuQJK
 VluHMkLcrsKcMy6g4YbE+oAvXtPXMy2FWN6a/TpmG0ii/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1cgc0c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 10:06:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93918756165so739025585a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788861961; x=1789466761; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XDuazRtZb7js9s2s9w00zibOjPpf7qRhb7cOuOybBl0=;
 b=LoId291Lvzvk7bmryyb2FB93ePL2rPHuwPw/lv2WZNqS5rCd9hB5mX7bpzexcyRz/k
 faTiIw+uanAO92eHQUypU9vuWrQlqx0LoACn7UJpyu9VwNqXXxjHokacc8Qz0AYRBEbT
 1TSk3Gh7jqgVFTLHhgzgzxI8eh3SLx1o3QEGHTYifE4oOgoj2f0Ds8hLuQxxEUYgyldL
 2s/Y1ybqakSEsJwdCJMoDdXkYjOWA/Gjc/yp187Lxw1vnL1IWW045JiJ7Bdg2g+dKr3n
 Q388Sz7pJLmRyIFVhWuA1a69EdLj0geW8uT/ACtkQSDwDztaSf70fgCCMihby/C+yC5s
 ZNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788861961; x=1789466761;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XDuazRtZb7js9s2s9w00zibOjPpf7qRhb7cOuOybBl0=;
 b=J3ORZffxKffgON6dbfGjSBjyfUXJRHMEc0DRp0nY9UmtiblLMo3l29HPOxfPOKDQl9
 /2i1H7748N3iEa46u0KqcjJ3YDr49WflWqDd11IJRruN18nWb/7C0hYK5nhKuLSy9e75
 jhv3yV2yFS4trEgN1G6RAuAdFbWvlli9IWADE4VF3xW6IuZMc59jLv5R7zYFrteDmeS+
 WS2M6fEPVDUIiTsiXR9hEpP/Jw4xDCIK3jrkUCGTxZBLVD5M8ia1eCXcCipit3wYHBb1
 bUyeOgegwgeIndwF0KQyQF7NrxTRptfdyFnWikwspz3bCS/9cf7TiG6qFfgr5jcSlgpd
 4Ckw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8g3q4gnHbK5la7ytjSDAKia9/g87J8gbm/5iB164lpOlbG9A740hhr0SZ906Nv1/wWgDLYJyg4vmI@nongnu.org
X-Gm-Message-State: AFuF++nJSGVb+qcEq00xLIgfc4VCj0iOQj0oUjmdQeodn/Jlh9PoxKjK
 bQXD9eBA7W2mPmMCYE9mtRfRq8e+yGQFEOu4UyRa4yEEkjio8s9wj4BM64YpN8qZrjzVp9GqvuC
 040FJ91BaHybWqVziD4Y+G1XEa9XqROj8awMDdMIBQrTqOkB4w7mh8HAN6Q==
X-Gm-Gg: AYBFou38LYrI/gzWV3sz1u3qDsMDBD2EE81117mtR21Wps/jP4gWL8TS7XJC8pndbFK
 QNrqVfgUt37J3Nc5MjyiuJoB4ysS2Zth6QOTrg4oDQ8t6klJJqfjxK1cM3bpYLsbkoHge4yBjNZ
 OwCObbllq2CS+Av8QNmF0u9ykSU8QuswsHgLS9bGWvKpDawSE1JLGiwW/CfZ5UUYQaQil54/RV6
 tRCJBTsr6obr17UpmHHEOuwvzQwgSVdyJRiyqEmzAQ9AEFZhyr498R2hRLY1bmEBDk0pKaxyLvD
 +er22+Nrs9qSnARjOJRZvHTRSZHMddS6DOqlbEElDvG5JqBL9yvbhOdr3HInEjOhKVJ4uFUIlW9
 llg61/Rlnld6mQiXLWAH0pWEyikqy89Xph0VThw==
X-Received: by 2002:a05:620a:4686:b0:939:9d8f:cb50 with SMTP id
 af79cd13be357-9399d8fcc8dmr1861095485a.44.1788861960773; 
 Tue, 08 Sep 2026 03:06:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:9d8f:cb50 with SMTP id
 af79cd13be357-9399d8fcc8dmr1861090085a.44.1788861960310; 
 Tue, 08 Sep 2026 03:06:00 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c26263cb042sm457498066b.47.2026.09.08.03.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 03:05:59 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:05:58 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, leif.lindholm@oss.qualcomm.com,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v10 5/5] docs: add riscv-server-ref.rst
Message-ID: <wbr4q627iwaqltkrqds2qoz5jnupjhmf3x3eb5bf2o3orf35fr@dpjs2pzvkten>
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
 <20260904195610.964829-6-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904195610.964829-6-daniel.barboza@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6a9fde09 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=NLiCwHATAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8
 a=FRSEYCzRAAAA:8 a=_-0T5nacJPHRRYsZgRYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=F9tHCgz3TLBaZgltkx5D:22 a=xVlTc564ipvMDusKsbsT:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: QzKtfgm0wougr-RczKCdG8OeKm2yNgR0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfX6y872haWtKHj
 IMqohFcm3lu+T0YESRKCRUE1WyPFsYUC0+6Gq+I/rwvi6qSM9cjE4cHudxfYZB+0jhXVII4yi8l
 jCVxtX5nCGJtYFXnNoGMmFjyT+suTn8=
X-Proofpoint-GUID: QzKtfgm0wougr-RczKCdG8OeKm2yNgR0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfX5OdeAxoJnwvn
 PAcxJ4S0ZMXnbzwzsGJRSJNWEHihGx1uihSDsdXYCR6u8bcjRnHA246e/9D9W93JkOeSe1wpAmB
 VmuITKyHMNxa/XYobVsTHTQqjJ+5rRadOl3oxbgdE14Lv7Q2DVSCGpvgZPbitiQV6fW/uYGhvxP
 Gsee4COnoLAA+SPTY0HV7J3w9CWkv1gEeDmSEGinw4IU2jiZe6citplxJAri3PGE7NVf9VCtPQN
 oRqKXKx+zl+7goHJDXxnaNhGcs4vC65gg1K6eNyIIwitkFrLEfb62Ic1c8bHou0TxJpg/j7Ogib
 UdVK7MZHQK4f19zjjYeQRxDU847y/Pg3Dy/Oy0/v972MYW//kIX8Q04tzHNHi+RhRLXwzOeoHtJ
 oTB2FkuEK2guEKzpE8XK4FBu1fjQ9J/4WpeEuST6KjqYLYAxVPS7+to/KKDvCzELLQs2W1szdy5
 mJ5Xr1QEDeiVk1AIq2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080106
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On Fri, Sep 04, 2026 at 04:56:10PM -0300, Daniel Henrique Barboza wrote:
> Add documentation for the new riscv-server-ref board.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Chao Liu <chao.liu@processmission.com>
> ---
>  docs/system/riscv/riscv-server-ref.rst | 62 ++++++++++++++++++++++++++
>  docs/system/target-riscv.rst           |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 docs/system/riscv/riscv-server-ref.rst
> 
> diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
> new file mode 100644
> index 0000000000..0573b4e07c
> --- /dev/null
> +++ b/docs/system/riscv/riscv-server-ref.rst
> @@ -0,0 +1,62 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +RISC-V Server Platform Reference board (``riscv-server-ref``)
> +=============================================================
> +
> +The RISC-V Server Platform specification `spec`_ defines a standardized
> +set of hardware and software capabilities that portable system software,
> +such as OS and hypervisors, can rely on being present in a RISC-V server
> +platform.  This machine aims to emulate this specification, providing
> +an environment for firmware/OS development and testing.
> +
> +`spec`_ is version 1.0 at the introduction of this board.  New spec versions
> +might trigger a revision of the emulation itself, which will strive to always
> +match the latest version available.  In case the emulation changes aren't
> +backwards compatible we'll introduce a versioning scheme, probably via
> +a machine property, to allow older SW to run with older spec versions.

We'll want a versioning scheme even if the new spec versions are backwards
compatible because users will want to be able to test their software on
strictly the older spec reference models, not just compatible later
models. That allows them to be sure that the software isn't using anything
provided by the later models which is not provided by the older.

> +
> +The main features included in the riscv-server-ref board are:
> +
> +* IOMMU platform device (riscv-iommu-sys)
> +* AIA
> +* PCIe AHCI
> +* PCIe NIC
> +* No virtio mmio bus
> +* No fw_cfg device
> +* No ACPI table
> +* Minimal device tree nodes
> +
> +There are multiple ways of using this reference board.  The spec compliant way
> +is using an EDK2 image and a TPM device.  The board was tested with the TPM
> +device ``tpm-tis`` that uses the external ``swtpm`` emulator.  More info on how
> +to use this device can be found in `tpm`_.
> +
> +To use this board coupled with the tpm-tis device, first start the ``swtpm``
> +process in a shell (the ``log`` parameter is optional):
> +
> +.. code-block:: bash
> +
> +    $ mkdir /tmp/mytpm1
> +    $ swtpm socket --tpmstate dir=/tmp/mytpm1 \
> +            --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
> +            --tpm2 \
> +            --log level=20
> +
> +And then start QEMU with:
> +
> +.. code-block:: bash
> +
> + qemu-system-riscv64 -M riscv-server-ref \
> +     -bios fw_dynamic.bin \
> +     -kernel EDK2.fd \
> +     -drive file=nvme_disk.ext2,format=raw,id=hd0,if=none \
> +     -device ahci,id=ahci \
> +     -device ide-hd,drive=hd0,bus=ahci.0 \
> +     -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
> +     -tpmdev emulator,id=tpm0,chardev=chrtpm \
> +     -device tpm-tis-device,tpmdev=tpm0 \
> +     -nographic
> +
> +
> +.. _spec: https://github.com/riscv-non-isa/riscv-server-platform
> +.. _tpm: https://qemu-project.gitlab.io/qemu/specs/tpm.html
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index 2639866a3e..74e23fa64c 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -70,6 +70,7 @@ undocumented; you can get a complete list by running
>     riscv/microblaze-v-generic
>     riscv/microchip-icicle-kit
>     riscv/mips
> +   riscv/riscv-server-ref
>     riscv/shakti-c
>     riscv/sifive_u
>     riscv/tt_atlantis
> -- 
> 2.43.0
> 

