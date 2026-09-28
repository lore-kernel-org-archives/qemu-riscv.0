Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5539CA5FA5
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 15:22:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBDBX-0000Ki-BK; Mon, 28 Sep 2026 11:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBDBR-0000Jq-SZ
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 11:22:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBDBQ-0002dC-48
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 11:22:25 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SEe1Yp1498400
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 15:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vqeueA5Dwdg+0bPoxFwzCulXHUqlvv8BKEZ0XdYkxOE=; b=didemMwdE77M6p0q
 WtiwDYc/HmaKD1X/Ke7/EsYHZEMrJLsN/eLI0TGjaE0q5iY19tYM8/bx2E/Praep
 d2YebbHuIxR9eniZw3EX8+4I99Lq2+cSDOj7tBE7ix+kVWWCG60ZFM2jY5r9y+KD
 W0iF8RzpPmO7V9MDWk9pSSJqrEUXxh/Wf3JxHT+jArih/JwE3ord26rlolDoVa68
 qSVbQF8C90YChxQIUOzELa1LY+dH6w65rXiOtFxBYrejEY1Aw6HNkCtpuShEjxL5
 7uLlL0guMJp44FLsz4zTfiqe7A5z72cmyxbCPfAS+H0TkatlmNpagY/AGuhcRKgG
 jXiRpA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5msykg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 15:22:20 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-8a7d69f4204so44888727b3.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790608940; x=1791213740; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vqeueA5Dwdg+0bPoxFwzCulXHUqlvv8BKEZ0XdYkxOE=;
 b=OFicUQf+D2YK2eB872Cb7h3UXExqNLNV/y11iaIJXxqxWRQCgRpZ8Mngbt6BIbHAfE
 s2tA7R0F7iUSKlRyAl24PR8E9TaG/GKyBD8AbexPLc9Ga7Q9skwg4l8P63Z1rYgcGMNn
 gKBznkFOMGpX43pRyjjF3d2IkK47MLSfPyeKMHY8aRopnlSceuoG0pur5HrRdzZ+0s+x
 Cnpjp2MxgHMKS7umXjE+zdwm4XCzecC4uusv2H6e/lZQQlaXmMu9J31+ods2DD1JC/NQ
 Y4zvvqWNEFiB2hWVH/5TizZeUaFjTMHf7hYq4VRhZ4KgiUjU3n0ja5PJfdC/5w3qyxlS
 7ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790608940; x=1791213740;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vqeueA5Dwdg+0bPoxFwzCulXHUqlvv8BKEZ0XdYkxOE=;
 b=f6MDNxl9m24lfCFAvCGS/6+uYl9tqJ3xXBJQw9211UZ0UUq8F6mMQejune0uYa1dqK
 8jB9RwcW8luqPWWGrkV4kZVj3Oym0MQICzzP4O90JxGAuk7h4HmnB/8bvh9lOM/wTc6f
 TOpnF41oL9sVfpBDWRr4oV4peAX+mvObt278e9VxLrK/NaIu5FNkvHCkOvsSe5CiQq73
 Dz0lyYKCRalXRsgS8ykKQwjHp8smW/DL4sNFmn2zM0I9y0+3p7pwCGaIgrkFdGPjgA1M
 jLknhhmPJFGPy7I0WtOBDhzCqg/6r258KBr7sBNt59yD4qKz3EHpnbUWwN/VYE8O+3FE
 mtnw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzuJCHwoVsaf1+gJhZBE0g7RoaAbuOiBLDJkjEpSPeDIV0gcJHowgunMTIsjfeBy26KMkB77SbxVZY6@nongnu.org
X-Gm-Message-State: AFq9FYL1bCIDSO0+KlKw+Pmqjgg7jqcjrwuZ4Bx9iAG+DVh6cY/VHKdN
 GUX/nwb+AdzaUiqH8ds5HQGEQCJCg3yhYu009DJjgLQpaQY+/JMrKW/73SGKEyIx40eBO3Nn3aq
 Ikb4jyZtQ5QZkwVGPqEGZfCns0zYDD9ryeXZ/O2TBBTMCuIGyLCxYE/xVHw==
X-Gm-Gg: AYBFou2LYPiyYVIoS5B9LDVnhseanpUD8iXHE24Q2nzn0ohQksK48LH5VnofawtC3tT
 3LWnPthTa9fPR/iQlrDB+DOrBrS1Jhjxko6zBxeY6qx+yG41udEP6AFjV22BXFyL7vDxaUUMpqH
 ztCgGjRUeQO8UTeIIatzZnxabTy/5rcCtdP+bqUM6eA4aVUnpzxO+fmMjibvGVxi1KQb0669O9J
 6346YzsFMAi6CzhVlG0V6MWFX0fz8auCvPD1eJNmk8KDXzkY2iIX24DgBeo/bCPx4zk1XxjUGSZ
 /BITMDHwi+pS6tYdoLmM11gOhbKgG7qcGx6CHEK3XraLNoj6iBhUoiDO+L7kPy4VYACOZbZxRd8
 j2dXrlTfVQ1OAK3QqF9Bg21HOJ391yDMbXA==
X-Received: by 2002:a05:690c:83:b0:87f:bf8d:3377 with SMTP id
 00721157ae682-8a64e4b9525mr64414887b3.63.1790608940097; 
 Mon, 28 Sep 2026 08:22:20 -0700 (PDT)
X-Received: by 2002:a05:690c:83:b0:87f:bf8d:3377 with SMTP id
 00721157ae682-8a64e4b9525mr64414597b3.63.1790608939607; 
 Mon, 28 Sep 2026 08:22:19 -0700 (PDT)
Received: from [192.168.68.102] ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8ab391acfb0sm2879967b3.48.2026.09.28.08.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 08:22:19 -0700 (PDT)
Message-ID: <2e837af6-720c-4ac5-9e5b-5750f45f23e8@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:22:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/5] docs: add riscv-server-ref.rst
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, leif.lindholm@oss.qualcomm.com,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com>
 <20260917174405.3471736-6-daniel.barboza@oss.qualcomm.com>
 <spgwi4uj47tgyscqpda2xpvrndgtydejudicqwdcltabxiyjje@bgv52z7nhuf7>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <spgwi4uj47tgyscqpda2xpvrndgtydejudicqwdcltabxiyjje@bgv52z7nhuf7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ikPvEw_dOp0AZDpAQfp9WcRNTwSB4G-6
X-Proofpoint-GUID: ikPvEw_dOp0AZDpAQfp9WcRNTwSB4G-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2MSBTYWx0ZWRfX8sKh3LCcEaQU
 oVvXdbuC0KcC04Dwq6v3Ia+n9Awwmwc1PPOQDGe1hWJUTQrwlEmJw+7f8C1CmXLOXEINMRIWQ+M
 cF3YOfotpCNakt3pqxHlhUZU2V0p1rSNDaEczKizAfUpvJ04g0q3Z9R3kOSzk23w+Q+szlELFlP
 yCiyz4S6LULOB5fccJ6XlmJFTsKu+88KQ9gBFRDfxEopwpy5M31rKTK/bWNouqaJmu8qKZULx8f
 Kx/DhdCMC4mx1P8ZhocIhlnoGwxDgDA/6Z63Zmu1h5eMj5khWjH8rGeXLJBi4uT6YoK9iAGFy9v
 XPBivMcFhU1FsmCiqAy3l2qvcdmM6vNze0LHUys3kWyGq4cDJGa+OR0EbxC2Fsww1I+7pgyKcy8
 9gbMT+Ib7zXCbmwpvjEqYD3n1Z+h8Vcd/9R0xLuaTqnEMbpp2Y4uPKdjK13PfpS+eC4MNO470Ud
 NbBLG4rSrCRi7mubfQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2MSBTYWx0ZWRfXy2jjuvUlwfQo
 83RqSqzT+IYYyiql36mSIWVIaqF3u6Dt8sZGkooNW/AmXU5AaUPZ3qhvoK2UMsamfp0ervJ3KKG
 Pvx04b/tQGH5LLED2kjplhwXYEh052s=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba862c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8 a=AbjpwKpZfJmGdCkLGqQA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=xVlTc564ipvMDusKsbsT:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280061
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



On 9/28/2026 7:47 AM, Andrew Jones wrote:
> On Thu, Sep 17, 2026 at 02:44:04PM -0300, Daniel Henrique Barboza wrote:
>> Add documentation for the new riscv-server-ref board.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Chao Liu <chao.liu@processmission.com>
>> Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
>> ---
>>   docs/system/riscv/riscv-server-ref.rst | 64 ++++++++++++++++++++++++++
>>   docs/system/target-riscv.rst           |  1 +
>>   2 files changed, 65 insertions(+)
>>   create mode 100644 docs/system/riscv/riscv-server-ref.rst
>>
>> diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
>> new file mode 100644
>> index 0000000000..5b23122f19
>> --- /dev/null
>> +++ b/docs/system/riscv/riscv-server-ref.rst
>> @@ -0,0 +1,64 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +RISC-V Server Platform Reference board (``riscv-server-ref``)
>> +=============================================================
>> +
>> +The RISC-V Server Platform specification `spec`_ defines a standardized
>> +set of hardware and software capabilities that portable system software,
>> +such as OS and hypervisors, can rely on being present in a RISC-V server
>> +platform.  This machine aims to emulate this specification, providing
>> +an environment for firmware/OS development and testing.
>> +
>> +`spec`_ is version 1.0 at the introduction of this board.  For each new
>> +supported spec version a new versioned board will be added, keeping
>> +"riscv-server-ref" as an alias for the newest version supported.  E.g.
>> +for spec version 2.0:
>> +
>> +* riscv-server-ref-1.0 - board that complies with spec version 1.0
>> +* riscv-server-ref-2.0 - board that complies with spec version 2.0
>> +* riscv-server-ref - alias for riscv-server-ref-2.0
>> +
>> +The main features included in the riscv-server-ref board are:
>> +
>> +* IOMMU platform device (riscv-iommu-sys)
>> +* AIA
>> +* No AHCI (can be added via command line)
>> +* No NIC (can be added via command line)
>> +* No virtio mmio bus
>> +* No fw_cfg device
>> +* No ACPI table
>> +* Minimal device tree nodes
>> +
>> +There are multiple ways of using this reference board.  The spec compliant way
>> +is using an EDK2 image and a TPM device.  The board was tested with the TPM
>> +device ``tpm-tis`` that uses the external ``swtpm`` emulator.  More info on how
>> +to use this device can be found in `tpm`_.
>> +
>> +To use this board coupled with the tpm-tis device, first start the ``swtpm``
>> +process in a shell (the ``log`` parameter is optional):
>> +
>> +.. code-block:: bash
>> +
>> +    $ mkdir /tmp/mytpm1
>> +    $ swtpm socket --tpmstate dir=/tmp/mytpm1 \
>> +            --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
>> +            --tpm2 \
>> +            --log level=20
>> +
>> +And then start QEMU with:
>> +
>> +.. code-block:: bash
>> +
>> + qemu-system-riscv64 -M riscv-server-ref \
>> +     -bios fw_dynamic.bin \
>> +     -kernel EDK2.fd \
>> +     -drive file=nvme_disk.ext2,format=raw,id=hd0,if=none \
>> +     -device nvme,drive=hd0,serial=ddaaddaa \
>> +     -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>> +     -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> +     -device tpm-tis-device,tpmdev=tpm0 \
>> +     -nographic
> 
> Should we add the e1000e to this example command line?

I'll have to re-send sdext, which will imply in another rebase and re-test of these patches,
so might as well add an e1000e example in these docs.  I.e. I'll send a v13.


Thanks,
Daniel

> 
> Thanks,
> drew


