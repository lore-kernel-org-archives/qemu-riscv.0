Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9584606A31B
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0GRsgQe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSMP0XHq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJKMd-0001Zb-F6; Tue, 20 Oct 2026 20:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJKMb-0001ZC-M9
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 20:39:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJKMZ-0006hI-Ad
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 20:39:29 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69KKth2K1716840
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 00:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hki1UadwPra700XH717J7g2dx+4hBwAsUMOk2G3WHBY=; b=V0GRsgQeJVhW0tRZ
 hmXbRRnuIIAvfhQHmJWG1YBuZOQoSmX3hWpq0/VGVcuDEyNAgJ7zTNdgiyHQnJ2q
 ipdmDWDM23W5lpYb+JQcet7PjKURYSi67r+uQnMIZzV5QJAkZ9ku/M7hjDE4reJ6
 96azoAno5YkUBD5eCppL1TROq/tjezR3J7RBWbNeYxKq3f7rJKMRcIqfuRFOXJ1t
 TCkiYVHXnjlvZXvUCi4oplyCYtDX5fKnJa7DgGog4NkR6CbLx6i6KS8eQeVwGW5S
 oub9Ve3VDk1M7aBmzIETTQpe8SjSc0rTcK8K3hs/TPVW3WMozZDgZ9NSuLnMESeg
 H23FPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb98yvk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 00:39:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-934963b2bc0so41670285a.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 17:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792543164; x=1793147964; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hki1UadwPra700XH717J7g2dx+4hBwAsUMOk2G3WHBY=;
 b=RSMP0XHqZjZmOtl+wIb0ON98EaeyPIclN8dHk3upUGNIZRMJJBlP077i/hu7n4Et5v
 mU1ZUt5yRtNtdJmWdxwciAluQgpkoAmbCMKoErc93f9J5DiHd9yCiwAYxfxMlxj+mNEL
 nHLyZT4HQaJR1d5fNks3PgvbGt/mzsYIMu8uAQkTL5yyNJ1Gjra+nN5PSN4HDl6S0wpF
 Vt2D5e/EiYMVeFSPrF7VF4TR4gLWPoFiXm0Sm6smQvEuPJ3QG9Rc00BpsDzc/pQTyTe2
 McMc6dzwb6FmB1HCwWBTf9x7vQSAwimtSzIbWeSFuu2BQj9Up1Ljx7LbizXV6v+S46A/
 SlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792543164; x=1793147964;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hki1UadwPra700XH717J7g2dx+4hBwAsUMOk2G3WHBY=;
 b=bmJiXWwyUWK6kHGgK5UlOxAfKghy6aOz0/IiY+YFvRMbLwvNfK2ULIUOOIlsKIArAV
 ZRN58dNADln6Sw4Dt6/bJQ8lNSpb+s+f+dYvnLndplfX8w0bdIWdAcXUBTBsWcVDRZC/
 4Pg3SrcbnPwv1wTdKEBD6ZBrF54TbGUUyQdkF2oVnOGwgtrV0Mm4Cqha1EgjpV0tAJ+X
 KUZP//0DnGyI9+/sv8CRu/r+mk+c7wn2kqpSFPodU8KWs3lrXyBIsrCj8DWY9utLrgSC
 IQPjQlco6MA/+IINgSU9HndJOTEglppAobPpoLy8B3uvfprsBTYIkseqSX1fqc+sU3Ke
 CJEg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDJDkkCg/LhQpwXPEJDkiXmT1jV8qdTernQj029NxpAIUNznfYqBvb/5fi7UDPf5n7X9+P8MerznSi@nongnu.org
X-Gm-Message-State: AFq9FYK+PbqYhgnEqrlXsztMxwQmmCCUeld0ekVRKQqjItlRewOkPPAU
 ubBpu892s1O7AA2CCd7ERIoRDBXz09WVADyheXtvz/Cr1ogwqwXcrtIp/OHAMCioS0901JBeLIu
 Qxo0eOYDtceudsemT5KbMUAjKBb6MAnorIzBFSX4FAA4qg9pedniEiqFSkA==
X-Gm-Gg: AYBFou2Ok5zKXkP3nnFSiIgm+ztWiHVETz3vyhqdLrceqn9p3WpJc6QatKfOyDdxFaz
 uTfDKZGDEFc8qXNO4SbsHO2jI8XSjj+nHiLlka8+Bs5fq4zHrvAoCyVwM9sHQsJxxl0ER+zk9Rh
 8jVHpfx+F4Yb00jbkBq5PWrak/pxoiMsWFy9OkNbO+Lc6zwoQqPbbRxZdWDELeuwP33i0wEKBaQ
 ts0rr0Gf3UcXR10PHR+zblzv09Gc++BfygIA0ZdVayVDJL4a5oXlZItik/8ODCPPCm09Fb/mQ6t
 ykstH/DyQalqUGFfGSXSrvMHc9qVBZKsr9+haZ/A9J6Y3T7pdTFp2Vz3wWSxSnbD9m3ExA6O1Pz
 LZ9KX7dZ+71m3CN683EtQn5WgrFPeZ60NQ1MN9Di47NoHk7GZRXRGkJ9db5FPVCyr4/AbNSVY
X-Received: by 2002:a05:620a:4109:b0:93e:c12c:43fb with SMTP id
 af79cd13be357-93f57f7540emr175470985a.72.1792543164252; 
 Tue, 20 Oct 2026 17:39:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:93e:c12c:43fb with SMTP id
 af79cd13be357-93f57f7540emr175468485a.72.1792543163781; 
 Tue, 20 Oct 2026 17:39:23 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f56e0b402sm117145485a.33.2026.10.20.17.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 17:39:23 -0700 (PDT)
Message-ID: <9c468ae3-e303-40da-bbc8-a22a82b9bc97@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 21:39:19 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] RISC-V: ACPI: Add PPTT support
To: Drew Fustini <fustini@kernel.org>, Sunil V L <sunilvl@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, "Michael S . Tsirkin"
 <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>,
 Prajwal N <prajwal.n@oss.qualcomm.com>,
 Shankar C <shankar.c@oss.qualcomm.com>,
 Jinjie Ruan <2118537295@qq.com>, ruanjinjie@huawei.com
References: <20261015064957.4076464-1-sunilvl@oss.qualcomm.com>
 <atfrQY1w-er0onXV@thelio>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atfrQY1w-er0onXV@thelio>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwMSBTYWx0ZWRfX3otdxChel4oU
 NUsVdEicvGJNwSSqhXA4KdAXnjCCqMt1xtRxBQ5sV6Zc2UngFePUZL2s861x1vZyJgry8Ke87Pb
 Ss+AGMmFbH3H7HuAL0UCL5XTFYxxuA4=
X-Proofpoint-GUID: 4CTS32UsTeuxzNDDUKwZwzCCWIjeUU2D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwMSBTYWx0ZWRfXxqYIAHjr4wIT
 dvcFa26TJLsJ8CmFFKCKlTaPeZit7OteTbf0UTmSYs7VE5k/DKkniYgClBcOnL3xkA7WXZT5O19
 Rs4ER/SjV00PYQBJ5RL+AfeftgTOBWc8gN7UCxef3yYo3XQ7jjl0NinQvjNy5AAk5ioWtAszjOJ
 nKfYnQarxWM1B7whFNfgtrPsL/B2yZkc+EajJlYzJKWW2ZiNlZMymMuBTAFcBiJtY/O2p2ywDha
 ZFhx99G0K+99IeMaeTRudFkBamngfgjrDDggaW7qJFgPDEMQOcRWX7ctJ/MvxtglW7IisNE8I4t
 j5SqPXzJPcq7bLZapoPHBwrLrj/cUQ6jDQA37afZDNmYkIUywu7dA+gXVcwQJCXcv0vz9iHRd1M
 JoZ3WaZ5AeVBot5ktdS/5wtjHkvG4Ri2Nj5vHw++jImVi/9UZsnUR+geT0W4GvKo3ZOzCViXGCi
 +p7nR2krv9b+Cg9wAaw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad809bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=dZbOZ2KzAAAA:8 a=8ZrYuC2gKm7xYYnm9eMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 4CTS32UsTeuxzNDDUKwZwzCCWIjeUU2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210001
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Drew!

On 10/20/2026 7:29 PM, Drew Fustini wrote:
> On Thu, Oct 15, 2026 at 12:19:53PM +0530, Sunil V L wrote:
>> Hi all,
>>
>> This series adds ACPI Processor Properties Topology Table (PPTT) support to
>> the RISC-V virt machine. PPTT allows the guest to discover the processor and
>> cache topology exposed by the machine, which is useful for making better
>> scheduling and cache-management decisions.
> 
> Thanks for picking up PPTT support. I can now rebase the RQSC support
> [1] on this series.
> 
> However, RQSC actually needs PPTT revision 3, because it adds cache IDs
> to the PPTT. The RQSC table references a capacity controller's cache by
> the PPTT cache ID. In Linux, find_acpi_cache_level_from_id() and
> acpi_pptt_get_cpumask_from_cache_id() return -ENOENT if PPTT rev < 3.
> 
> There is a new MPAM series by Jinjie Ruan which contains the patch
> "[PATCH 04/37] hw/acpi: Build PPTT rev 3 with cache IDs for MPAM
> cross-references" [2]. It bumps build_pptt() to revision 3 and gives
> every cache node an ID.
> 
> I could just base the RQSC series on this PPTT series and that patch
> 03/37. But maybe there is a better way to coordinate adding PPTT v3?

This PPTT support is acked and I believe we'll queue it in riscv-to-apply.next
shortly.

As for the PPTT rev3 patch in the "Add Arm MPAM emulation", my suggestion is
to put that on top of your series (i.e. your series will contain that patch).
That ARM series has 37 patches and might take awhile to go through, and your
work relies only on patch 04 ...  which happens to be an arch agnostic patch.
I believe it's fine for us to push it via the riscv queue.

I see that the author from the ARM series is CCed here.  Jinjie Ruan, are you
okay with us pushing your patch via the RISC-V tree?  It'll unblock Drew's work
and you'll have one less patch to worry about in your ARM MPAM work.


Thanks,
Daniel





> 
> Thanks,
> Drew
> 
> [1] https://lore.kernel.org/all/20260202-riscv-rqsc-v1-0-dcf448a3ed73@kernel.org/
> [2] https://lore.kernel.org/all/tencent_F9C68A515AC6C40BE2C32DB314E14CCB7106@qq.com/


