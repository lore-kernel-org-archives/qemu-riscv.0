Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F90C79F99
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 18:51:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x40uK-0001VD-Ka; Tue, 08 Sep 2026 14:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x40uJ-0001Uu-O7
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 14:50:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x40uH-0004oO-Vt
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 14:50:59 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 688Fdh452770183
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 18:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q4uxhD4zrmBO9r5xm60fgzvs2acm1edZj6z5KGOCw2k=; b=OXT2nJ76IqNw/G9i
 a++rooSxxaw6xiBxVgnbdXyTQz9ORDeCfxoUqWfms0s7BDv7FSKzlZ1afFyp1M8Y
 w1ABBt8jahMdB3o47k6scdCgAej4/ez3QCaalXNxW+/5iU0lBQz32WsImKMhmEys
 XzQppsbq5ch4LPSdTC/VQe9dXuOqUh1DnusPr3TSN1SsUBE5XUZPW7+u4sjyr1/b
 rr6kfMGVpsXd/WV9Pa1ZfT/Rq8TGkKnmlw6Dlgp/vI247VUytrNyLmKVfcSHBw46
 D6nwGg4w3UqC93KaVjonB9COl5PshqKq1vSheOKTz4EhlF3k9cob1vpQRrDINA1V
 B5/+rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvuhpw5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 18:50:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9390a2c895bso991996285a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788893456; x=1789498256; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q4uxhD4zrmBO9r5xm60fgzvs2acm1edZj6z5KGOCw2k=;
 b=gZ3HhsRo0RxztC7UbhAcB5AN1LJzAJkoeckOtO+LCoppvWwNmrilX3t6EkCfK3/MLI
 G5DMWIyP90LtaobcpPTPDmHSZtgTREX4VMWKFcL8kE3gYsipM2EmY1NAqr1rfTJ2smHs
 ddNfNr5EtUkl78Q4RafHCf6yL82WyE5jIzD4nLYxHrWC6Zfr2vI9RxMcz3cXIm5NC5eA
 h8mpWIQpIBUOljwYKNKa4VlK9UfsJcbyDeBrew09GbKaP+amuYElkut/tnIVTBq14sRd
 LiRQblS6U8p5nk4Fut77ZEidzMcvvFm3nFugUXNS7uSw/dlInHcwTEsTD7YP7OUNycE7
 smsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788893456; x=1789498256;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q4uxhD4zrmBO9r5xm60fgzvs2acm1edZj6z5KGOCw2k=;
 b=IVTH0cxsLujmd6E52dH8/9twlezt4bNRp46cBhGO/R9wBeUicycA4YDwofF6brNz6S
 1WXCAvba4KzL7a08Vu5QNVB4GM3iAynNeiq/M3UoeM2/9CTKV/YXmGBw/k8lb0sj/x5w
 DNo9pshBGn+HF11FHIqvT2gDmLqCNkvaxlo2t6CSR2eWp2TH18JnqvQFFcmiC/rWNz7s
 97xEnF8hLXC69oGvEwz03AGEY47Mauh1jw+FPtV5aEBICA/rkMvcUBXCdsezX+xEXshP
 FkgEx2QAXzhac7dyXRNgxjnQU6St7GQBt4drsdJe6bgj21JnJCPNlQXVaZElOjSD0Vwf
 7vcA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxy63dD2AERTPi70+UCwy07BqIyklDtRUmyjvrAvD3JBfh9HJTA/BM/RSe8MA31KJ+gg5WEVQt2PfOc@nongnu.org
X-Gm-Message-State: AFuF++ngxZfTlzsWY/YjTurvKSAPCrsn4XXpSRZxJUHi+mrkOMxuA41o
 p3WMjrjGH5JPUYiLnN/Jqt+GSLWNz7yFgQe8jhdiwyj/NFPz+HVQjb/fFORgvszr0vihJOgulAk
 3IZzG9NR4E3XvfJacfrC644RKMkUgKTOHawbaPCTOn7ayvz85IKvLYihI/Q==
X-Gm-Gg: AYBFou2WbxzgjYEOz3P8dEnp+adEGF2bdHLKNyGiPuYfsbYD51k4ZtxpM2HSgwml8uA
 DqVHP1dLXWYapnfKqVghEykpL9VvOaRvxuipnh+NWbxhHjP2LjIetUbEPNp4/gw1wF/dCdlEFYm
 cUuflJvifPtUt3V5MFNNnuk1CRVxHU66XnHQ7qqTLvlssolQOMOSbwcJM0PqVKB2quoLEtUORuV
 gN4MvGKQ2bxVUMCZEFCe/Af7KtTAvR8nK58c2SEaCWaD8A+2AAqKocGrlnX/dtMctWTtl7GTMh0
 RLJ25jO/fR4P4AL+6r/uRPfXMdNRJ89YArGVbUcNq9Q8NcCxW03oVrR7F3V7kqzfC6xapunPJRg
 V2QfOPHYmcllbx9qpOMwfSgbEbfnDCOGwy08=
X-Received: by 2002:a05:620a:4610:b0:939:4a34:621e with SMTP id
 af79cd13be357-939806da32fmr3093315385a.28.1788893455759; 
 Tue, 08 Sep 2026 11:50:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4610:b0:939:4a34:621e with SMTP id
 af79cd13be357-939806da32fmr3093257585a.28.1788893450568; 
 Tue, 08 Sep 2026 11:50:50 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397fb33619sm1206417685a.22.2026.09.08.11.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 11:50:50 -0700 (PDT)
Message-ID: <b7a2f727-55ac-486c-85b9-6662c597a30e@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:50:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] docs: add riscv-server-ref.rst
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, leif.lindholm@oss.qualcomm.com,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
 <20260904195610.964829-6-daniel.barboza@oss.qualcomm.com>
 <wbr4q627iwaqltkrqds2qoz5jnupjhmf3x3eb5bf2o3orf35fr@dpjs2pzvkten>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <wbr4q627iwaqltkrqds2qoz5jnupjhmf3x3eb5bf2o3orf35fr@dpjs2pzvkten>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2QRlbOM6s8DyieCRUJ6gaMT68mqe5T5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIwNCBTYWx0ZWRfX5Fj7S4UDxqlJ
 SAqzVbp0sTlCdR2ESpMTTwUXIiJc09f/+l0dhMpFxQ1KGa/eHWWkBU5R0JTbruvg9iIe7flahVr
 nB6/HiDfAW/u9Ck6OZ/2yLKZnNrbRT9c5dm5WD1g8MFG+WuhbE+ZDApLkYYWBMosXUjFKhFo0V5
 xvatcSlI1EZeL/xR1eN1zU/P2jBtNcUq7W6jZW4jIPNSjjuzDwr5x9SXUmJn+5rSROAbnq5rWC2
 doEHymIyHaOdunyyrluxdDjdgpClPc9J86sfTLDICxLIXcaElV1L/AjJhp3if/AWJHVrrCdyC0W
 2m7Pq7cvS/rvc7tGISJnshSG7/hzy+otrm0iek8AGZ7TV/NRC2X0VWI1Z5hGFNpG8tdZxmueNnf
 hUXqSXi6PO1TRFRdnLEBR9lCBC5psMj85LKWXrWx1sj1mmaug4mBde1FuRteNgtr1lh3bKWzgLV
 XJ00N/5GY7717OTZukQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIwNCBTYWx0ZWRfX93+XBiv4zzX+
 trUqXDv2Zps65+kYzVAAU9ta9NOqLjThn6d4LjsFuIJey32WqasOK2acRnBI0L4in5Un4tavg9c
 Ks6uU9AbzcjgRfoHf2f2vbiuNOArwOE=
X-Proofpoint-ORIG-GUID: 2QRlbOM6s8DyieCRUJ6gaMT68mqe5T5y
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa05910 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=NLiCwHATAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8
 a=FRSEYCzRAAAA:8 a=XWWM0xVod75z28mxWacA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=F9tHCgz3TLBaZgltkx5D:22 a=xVlTc564ipvMDusKsbsT:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080204
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 9/8/2026 7:05 AM, Andrew Jones wrote:
> On Fri, Sep 04, 2026 at 04:56:10PM -0300, Daniel Henrique Barboza wrote:
>> Add documentation for the new riscv-server-ref board.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Chao Liu <chao.liu@processmission.com>
>> ---
>>   docs/system/riscv/riscv-server-ref.rst | 62 ++++++++++++++++++++++++++
>>   docs/system/target-riscv.rst           |  1 +
>>   2 files changed, 63 insertions(+)
>>   create mode 100644 docs/system/riscv/riscv-server-ref.rst
>>
>> diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
>> new file mode 100644
>> index 0000000000..0573b4e07c
>> --- /dev/null
>> +++ b/docs/system/riscv/riscv-server-ref.rst
>> @@ -0,0 +1,62 @@
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
>> +`spec`_ is version 1.0 at the introduction of this board.  New spec versions
>> +might trigger a revision of the emulation itself, which will strive to always
>> +match the latest version available.  In case the emulation changes aren't
>> +backwards compatible we'll introduce a versioning scheme, probably via
>> +a machine property, to allow older SW to run with older spec versions.
> 
> We'll want a versioning scheme even if the new spec versions are backwards
> compatible because users will want to be able to test their software on
> strictly the older spec reference models, not just compatible later
> models. That allows them to be sure that the software isn't using anything
> provided by the later models which is not provided by the older.

I'll change this to:

`spec`_ is version 1.0 at the introduction of this board.  For each new supported
  spec version a new versioned board will be added, keeping "riscv-server-ref" as
  an alias for the newest version supported.  E.g. for spec version 2.0:

  * riscv-server-ref-1.0 - board that complies with spec version 1.0
  * riscv-server-ref-2.0 - board that complies with spec version 2.0
  * riscv-server-ref - alias for riscv-server-ref-2.0



Thanks,
Daniel



> 
>> +
>> +The main features included in the riscv-server-ref board are:
>> +
>> +* IOMMU platform device (riscv-iommu-sys)
>> +* AIA
>> +* PCIe AHCI
>> +* PCIe NIC
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
>> +     -device ahci,id=ahci \
>> +     -device ide-hd,drive=hd0,bus=ahci.0 \
>> +     -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>> +     -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> +     -device tpm-tis-device,tpmdev=tpm0 \
>> +     -nographic
>> +
>> +
>> +.. _spec: https://github.com/riscv-non-isa/riscv-server-platform
>> +.. _tpm: https://qemu-project.gitlab.io/qemu/specs/tpm.html
>> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
>> index 2639866a3e..74e23fa64c 100644
>> --- a/docs/system/target-riscv.rst
>> +++ b/docs/system/target-riscv.rst
>> @@ -70,6 +70,7 @@ undocumented; you can get a complete list by running
>>      riscv/microblaze-v-generic
>>      riscv/microchip-icicle-kit
>>      riscv/mips
>> +   riscv/riscv-server-ref
>>      riscv/shakti-c
>>      riscv/sifive_u
>>      riscv/tt_atlantis
>> -- 
>> 2.43.0
>>


