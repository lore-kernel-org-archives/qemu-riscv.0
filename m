Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F395F606A31E
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 19:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJt2M6Nj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ntlb5SFy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVwed-0007fQ-Mn; Tue, 24 Nov 2026 14:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVweb-0007eA-Mh
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 14:58:13 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVweZ-0002yE-52
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 14:58:13 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOJLBpn1722530
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 19:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 27diqqsJgiNVBSjFzqT14zEgS12fI+td0xwaQ0uA6w0=; b=XJt2M6NjipQcuMUK
 PMFOsNf8KM08O9e/KMfSlcW0DRQ55icwSDmlHGNemxd15ZVNnjJ5EMG7Jq8BYz6g
 cBoXwJDHQqoRsj9a/zYYgsb6HIYdU4q9T9cn5O2cFoF2wL2ilVE2fmNVLF4zScRA
 BJTbSs+9IfKuAc+mVFMMn7rP3yQWZne2sQerQJmG3GFoY1aJABAkpFxqVOg2l5Bm
 b7f3fcgudFgByM2J4OSmwiccoQ+YiQTYIqAr6w0aqJ31SR9AOgGrIoWYSVS8nRQ1
 u57/PJOgxVmakQALWZV/8F1XrL71T42FryS2FSxGV6LnbWfaOrvGtyOseNEKhUi+
 ck8EPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns84ar-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 19:58:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f2373e9b4so539967585a.1
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 11:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795550288; x=1796155088; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=27diqqsJgiNVBSjFzqT14zEgS12fI+td0xwaQ0uA6w0=;
 b=Ntlb5SFygA1y3Q+KHrSaJa0Zh1mthqm36B0DFz3309bpRWNbPRat+N5vEBGnvMQAx5
 RGKrYxfO9ulWtJjo5ulhLC27Kukcv67i/79/vIRgvZVAUHBuL6O4xACi4YJahRcvxm3c
 nBaUugG5LgsAJx41FUyq5VFgb6X2jdbMNbu5Gt+8PcKC804psNkAugwgYjs4zcElwGdA
 ULLj5tMZJIkuSPxXJYyURGHdTNKOm5k5IPaTwF0fD9qIOijEdAHulhIGY+2ZXmd4Qq25
 6k/ymQZapzenp3r/ry8c0IueRkpnqGDXGaJIOKC26lEXWkAj6FTdCGPqvypiTy65lrHH
 19NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795550288; x=1796155088;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=27diqqsJgiNVBSjFzqT14zEgS12fI+td0xwaQ0uA6w0=;
 b=Pza7a12FxbNz895xacPVgpdO+GI/pdY/1HZYgQehitaAfOzG0WFTZzXsmve54/OZKZ
 J1qlEz3koW/Uje2C7WMnAP7VBXqCd3Qudvegof6ySQ+zlzFmmsudwMa/zoKBmeI4mn62
 xNA/AwImljMu28bF6Q/fNZWd8q+aM5Sf/Y2Wbc3filqR+rDiOBAe5GzMjvAX8QfmbR9y
 XTD8Hck/D3nB5KdeNSzxWslT6Pv4UAFcHpZmnwjopVNyrXL5bi79O0Y/hjL7+RcDlelS
 bCQ6pXs804Kn6Z8ST7CjVbCEw5WxH/WK74pvyWHMgn9e2LaqTx4y61IrVyWJ4Wfysinc
 8bVA==
X-Forwarded-Encrypted: i=1;
 AL+hErEPpqYMI+QZjVVaqUxON7EMPUUan7zwoi0OA6hJ16kWNH5Te/FifBqjAXwsPmKYRjg0vQWj7OlsJb1j@nongnu.org
X-Gm-Message-State: APuU4Z+LsxgyZzO3Alck/5135IzqfsWMuht/2Z3cI3gWY8zDzNCNXGoX
 9INgn6vjtq5McNcDGEFOZKkr6zOKSqsRZA7RuOuUrSldiq7b0QxYn5Lh+Ox36ECI80m3gj+m6Jz
 fyiu40TPwUm7U8wbh/jKlybAt5+V3FpTwGqj3hcasH9aZNttQ64BHNk+xrQ==
X-Gm-Gg: AZFdTZfRY2d0MXgO61gw+foa4OLbTXJBIQeXtMH8/0WfEZCYPpRfEgCXTHuSjkoSYi4
 O4yYLR0Hyh/0B39RWDNOU7RQ0IzSJQiAEpHoHwKS9Z9p1Fym5YoAL7kjUrqJAxb2V6jn+/HgaUz
 LZ4g92+jl25AbTMWSmnU4lv10vBcsSGgLFyDPxNFPuNZl+4uG3iz0gLbBkiBm/Eylt7sQgAf2JN
 7SpQ9tfzhkPRPg4jBeP4xXmZvF8fi8i9kpRfuBD+UvbDF93Mz/lFuNWWUG4tOUgsEREPnIxZe9P
 YG4WGF7a2TvA5NpOI1DWBK6/8oHbTHYU9/FYbkL+1T8o0DNrBTupjJ5DXWxVV6HSXls6fYW1FYM
 y46+ulHB43st1ddMHk7A6yvUg6flbDv6AMM5zuQ8pa251rFTo7fR+0dOHaaeubtufrKdRZ8XcO0
 EPJUSB7aA6
X-Received: by 2002:a05:620a:3914:b0:93e:c12c:fbcf with SMTP id
 af79cd13be357-949bac78c6emr2201208785a.75.1795550287728; 
 Tue, 24 Nov 2026 11:58:07 -0800 (PST)
X-Received: by 2002:a05:620a:3914:b0:93e:c12c:fbcf with SMTP id
 af79cd13be357-949bac78c6emr2201203085a.75.1795550286992; 
 Tue, 24 Nov 2026 11:58:06 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb38319asm1123548685a.16.2026.11.24.11.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 11:58:06 -0800 (PST)
Message-ID: <c6b84ec8-ca25-4647-99c8-5c7a69494e8b@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 16:58:02 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] hw/riscv: iommu: Support automatic PTE A/D updates
To: Gong Shuai <gsh517025@gmail.com>, tanchi25@mails.ucas.ac.cn
Cc: alistair.francis@wdc.com, chao.liu@processmission.com, liwei1518@gmail.com,
 nutty.liu@hotmail.com, palmer@dabbelt.com,
 pierrick.bouvier@oss.qualcomm.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com,
 gong.shuai@sanechips.com.cn
References: <20261113151251.30618-1-tanchi25@mails.ucas.ac.cn>
 <20261117143010.1286497-1-gsh517025@gmail.com>
 <841c86f7-9b78-4486-991e-ccec2eede0ec@oss.qualcomm.com>
 <95fe4c53-fe13-4e0c-abbc-bbb546850560@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <95fe4c53-fe13-4e0c-abbc-bbb546850560@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 771Nghn-_jTgfvBZR-S0gPx8zfF-_nhl
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b05ec51 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=5RGcKFkg7OM-Yh_-VPEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX6p8A4GX7vxl5
 3V7NjkhwFn6lJY2L8WMQUvcvtcxYfKuBEsLts+2Ouo5Cd+4RllxSPDiUm/zZI5IQrbwwkbJL0Il
 0iterakQeEJJB3UCx+zr33cPI979wHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX0lIqd+cbhxnn
 IOkE72zoSJDccbCQUcG2p1rMhP6va+H0g9OEsTgBwyr9ZNpHX9Wk6EkWX+OJjAkNklK45NXEKSR
 AwRRnhWeHn/ZRji3n38w9vnGJD0hf2sR3D5yeYYr5JHRkMXIAMZE+Ua5MTCTTvFWQ1HAIKprnFD
 FZCXp1hV4ZbIoL7mrG6885fNvbHx90OiWwAPtX7po21n9qEz2OqjC1J+iF/N2vnch+mSgMuszKk
 Wc07mnbkQzO9pZxn6d1qG740Bg0RMelHASiknSlGgrby1I+lhtgIBQo021H7u1WuRUJ+UxYqwWz
 NdOjhXgEGlU0imfMy1TinRiu2QE63x9dQLNTZeEy9tXTvZ4fmMNuYiDgE+JbWAXIbDs8o7DATd9
 7evC3v1qG6uJpt9HVS9BlC/NZbmO8hUykvhYlDAztKZDRRB/Hox9nGpHrW+6ZhquC5eqyQFfuyO
 6EdutxMhYMozBFgTPAg==
X-Proofpoint-ORIG-GUID: 771Nghn-_jTgfvBZR-S0gPx8zfF-_nhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shuai,

On 11/24/2026 2:18 AM, Gong Shuai wrote:
> Hi Daniel,
> 
> On 11/24/2026 3:58 AM, Daniel Henrique Barboza wrote:
>> Hello,
>>
>> On 11/17/2026 11:30 AM, Gong Shuai wrote:
>>>> This series adds support for automatic updates of page-table accessed
>>>> (A) and dirty (D) bits in the RISC-V IOMMU, as specified by the RISC-V
>>>> IOMMU architecture. The feature is advertised through the AMO_HWAD
>>>> capability and controlled by the SADE and GADE bits in device contexts.
>>>>
>>>> The first two patches fix implicit G-stage page-table access handling
>>>> and IOATC permission checks. The third patch implements atomic A/D bit
>>>> updates using CAS, with page-table walk retries on concurrent
>>>> modifications and G-stage permission checks for implicit writes during
>>>> nested translation.
>>>>
>>>> The implementation has been validated with QTests, Linux DMA tests under
>>>> KVM and TCG, and concurrency tests covering CAS retries, PTE
>>>> modifications, and G-stage mapping changes.
>>>>
>>>> ---
>>>> Changes in v2:
>>>> - Set iotval2 to zero for S-stage page faults, as suggested by
>>>>    Daniel Henrique Barboza.
>>>> - Avoid duplicate implicit_read calculations, as suggested by Nutty Liu.
>>>> - Document the new amo-hwad device property.
>>>>
>>>> v1: https://lore.kernel.org/qemu-devel/20261108143934.129923-1-tanchi25@mails.ucas.ac.cn/
>>>>
>>>> Tan Chi (3):
>>>>    hw/riscv: iommu: Fix implicit G-stage page-table accesses
>>>>    hw/riscv: iommu: Check permissions on IOATC hits
>>>>    hw/riscv: iommu: Support automatic PTE A/D updates
>>>
>>> Hi Tan Chi,
>>>
>>> Thanks for your work.
>>>
>>> I have tested this series on my nested IOMMU setup.
>>>
>>> - Outer QEMU: this series on top of master, -M virt,...,iommu-sys=on,
>>>                -global riscv-iommu.amo-hwad=on, emulated NVMe
>>> - Inner QEMU: needs accel=on support for riscv-iommu-pci, and
>>>                vfio-pci with iommufd
>>> - Outer Linux host: needs hardware dirty tracking and nested IOMMU
>>>                support
>>>
>>> Test flow:
>>>
>>> 1. Boot host and guest, do NVMe I/O
>>> 2. Clear host S2 D bits and trigger GVMA inval in the inner QEMU monitor,
>>>     use command: calc_dirty_rate -b 1
>>> 3. Back to guest shell and do another NVMe I/O
>>>
>>> It completed without a guest hang or I/O error. With temporary local
>>> debug prints I could see en_s=1/en_g=1 and implicit G-stage page-table
>>> walks.
>>>
>>> One host-side workaround is that on the host I need
>>> echo never > /sys/kernel/mm/transparent_hugepage/enabled
>>> to avoid an hang with THP; otherwise calc_dirty_rate -b can leave the
>>> guest stuck.
>>
>>
>> Can you please clarify if this THP hang also happens on master?  It's not clear
>> to me if this scenario is already broken or if this automatic PTE A/D work is
>> exposing it.
> 
> Yes, the THP hang also occurs on master (2bfbe39d0fff).
> It is not introduced by the amo_hwad series.

Thanks for clarifying.  This means that we can proceed with the upstreaming of this
work without worrying about having to document regressions and what have you.

> 
>>
>> Even if it's a kernel/KVM side problem (as Tan Chi mentioned in another reply) we
>> should be wary of adding emulation changes that can regress regular software
>> usage.  At the very least we should document that we're doing an emulation change
>> that can break software that doesn't have a certain workaround/patch.
> 
> This is indeed a KVM-side issue. It is not related to nested IOMMU
> or the amo_hwad series; the hang was simply observed while running
> tests that involved them.
> 
> I can provide a simple setup to reproduce it.
> (Hope the following information is useful.)
> 
> With master QEMU as the RISC-V virt host and kernel v7.4-rc4 built
> with defconfig + KVM + TRANSPARENT_HUGEPAGE, running:
> 
>      timeout 180 ./dirty_log_perf_test \
>      -e -s anonymous_thp -v 1 -b 512M -i 2
> 
> hangs and exits due to timeout, whereas:
> 
>      timeout 180 ./dirty_log_perf_test \
>      -e -s anonymous -v 1 -b 512M -i 2
> 
> exits normally.
> 
> After applying the fix patch [1] to the kernel, both tests exit
> normally.
> 
> Detailed logs for the four command runs are provided below for
> reference.
> 
> Case 1: without fix patch, anonymous_thp ---- HANG and TIMEOUT(124)
> 
>    $ cat /sys/kernel/mm/transparent_hugepage/enabled
>    [always] madvise never
>    $ timeout 180 ./dirty_log_perf_test -e -s anonymous_thp -v 1 -b 512M -i 2
>    Random seed: 0x77be2754
>    Test iterations: 2
>    Testing guest mode: PA-bits:50,  VA-bits:48,  4K pages
>    Random seed: 0x1
>    guest physical test memory: [0x3ffffdfe00000, 0x3ffffffe00000)
>    Populate memory time: 0.277703400s
>    Enabling dirty logging time: 0.001101300s
> 
>    Iteration 1 dirty memory time: 0.086482400s
>    Iteration 1 get dirty log time: 0.000188500s
>    Iteration 1 clear dirty log time: 0.017205400s
>    Iteration 2 dirty memory time: 3.617855200s
>    Iteration 2 get dirty log time: 0.000093700s
>    Iteration 2 clear dirty log time: 0.014652300s
>    Disabling dirty logging time: 0.001215600s
> 
>    $ echo $?
>    124
> 
> Case 2: without fix patch, anonymous
> 
>    $ timeout 180 ./dirty_log_perf_test -e -s anonymous -v 1 -b 512M -i 2
>    Random seed: 0x68f16937
>    Test iterations: 2
>    Testing guest mode: PA-bits:50,  VA-bits:48,  4K pages
>    Random seed: 0x1
>    guest physical test memory: [0x3ffffdffff000, 0x3fffffffff000)
>    Populate memory time: 8.404907600s
>    Enabling dirty logging time: 0.001048700s
> 
>    Iteration 1 dirty memory time: 0.080460200s
>    Iteration 1 get dirty log time: 0.000119300s
>    Iteration 1 clear dirty log time: 0.014741000s
>    Iteration 2 dirty memory time: 3.689446400s
>    Iteration 2 get dirty log time: 0.000034200s
>    Iteration 2 clear dirty log time: 0.013190500s
>    Disabling dirty logging time: 0.000651400s
>    Get dirty log over 2 iterations took 0.000153500s. (Avg 0.000076750s/iteration)
>    Clear dirty log over 2 iterations took 0.027931500s. (Avg 0.013965750s/iteration)
>    Testing guest mode: PA-bits:50,  VA-bits:39,  4K pages
>    guest physical test memory: [0x3ffffdffff000, 0x3fffffffff000)
>    Populate memory time: 7.828295400s
>    Enabling dirty logging time: 0.000798200s
> 
>    Iteration 1 dirty memory time: 0.066219100s
>    Iteration 1 get dirty log time: 0.000039900s
>    Iteration 1 clear dirty log time: 0.023695500s
>    Iteration 2 dirty memory time: 3.429129500s
>    Iteration 2 get dirty log time: 0.000032200s
>    Iteration 2 clear dirty log time: 0.020796400s
>    Disabling dirty logging time: 0.000772600s
>    Get dirty log over 2 iterations took 0.000072100s. (Avg 0.000036050s/iteration)
>    Clear dirty log over 2 iterations took 0.044491900s. (Avg 0.022245950s/iteration)
> 
> Case 3: withfix patch, anonymous_thp
> 
>    $ cat /sys/kernel/mm/transparent_hugepage/enabled
>    [always] madvise never
>    $ timeout 180 ./dirty_log_perf_test -e -s anonymous_thp -v 1 -b 512M -i 2
>    Random seed: 0x3b6f1968
>    Test iterations: 2
>    Testing guest mode: PA-bits:50,  VA-bits:48,  4K pages
>    Random seed: 0x1
>    guest physical test memory: [0x3ffffdfe00000, 0x3ffffffe00000)
>    Populate memory time: 0.221626400s
>    Enabling dirty logging time: 0.001002400s
> 
>    Iteration 1 dirty memory time: 0.079966800s
>    Iteration 1 get dirty log time: 0.000119400s
>    Iteration 1 clear dirty log time: 0.012897100s
>    Iteration 2 dirty memory time: 3.490279400s
>    Iteration 2 get dirty log time: 0.000044900s
>    Iteration 2 clear dirty log time: 0.013184200s
>    Disabling dirty logging time: 0.000883200s
>    Get dirty log over 2 iterations took 0.000164300s. (Avg 0.000082150s/iteration)
>    Clear dirty log over 2 iterations took 0.026081300s. (Avg 0.013040650s/iteration)
>    Testing guest mode: PA-bits:50,  VA-bits:39,  4K pages
>    guest physical test memory: [0x3ffffdfe00000, 0x3ffffffe00000)
>    Populate memory time: 0.209773300s
>    Enabling dirty logging time: 0.000790800s
> 
>    Iteration 1 dirty memory time: 0.063432900s
>    Iteration 1 get dirty log time: 0.000040100s
>    Iteration 1 clear dirty log time: 0.012308600s
>    Iteration 2 dirty memory time: 3.367311900s
>    Iteration 2 get dirty log time: 0.000032500s
>    Iteration 2 clear dirty log time: 0.013141600s
>    Disabling dirty logging time: 0.000953800s
>    Get dirty log over 2 iterations took 0.000072600s. (Avg 0.000036300s/iteration)
>    Clear dirty log over 2 iterations took 0.025450200s. (Avg 0.012725100s/iteration)
> 
> Case 4: withfix patch, anonymous
> 
>    $ timeout 180 ./dirty_log_perf_test -e -s anonymous -v 1 -b 512M -i 2
>    Random seed: 0x679b7adb
>    Test iterations: 2
>    Testing guest mode: PA-bits:50,  VA-bits:48,  4K pages
>    Random seed: 0x1
>    guest physical test memory: [0x3ffffdffff000, 0x3fffffffff000)
>    Populate memory time: 8.066872600s
>    Enabling dirty logging time: 0.001247200s
> 
>    Iteration 1 dirty memory time: 0.081895900s
>    Iteration 1 get dirty log time: 0.000186200s
>    Iteration 1 clear dirty log time: 0.014706800s
>    Iteration 2 dirty memory time: 3.441165900s
>    Iteration 2 get dirty log time: 0.000031500s
>    Iteration 2 clear dirty log time: 0.013069200s
>    Disabling dirty logging time: 0.000469100s
>    Get dirty log over 2 iterations took 0.000217700s. (Avg 0.000108850s/iteration)
>    Clear dirty log over 2 iterations took 0.027776000s. (Avg 0.013888000s/iteration)
>    Testing guest mode: PA-bits:50,  VA-bits:39,  4K pages
>    guest physical test memory: [0x3ffffdffff000, 0x3fffffffff000)
>    Populate memory time: 7.804275600s
>    Enabling dirty logging time: 0.003435000s
> 
>    Iteration 1 dirty memory time: 0.067627700s
>    Iteration 1 get dirty log time: 0.000037100s
>    Iteration 1 clear dirty log time: 0.013302700s
>    Iteration 2 dirty memory time: 3.433272000s
>    Iteration 2 get dirty log time: 0.000031800s
>    Iteration 2 clear dirty log time: 0.013085400s
>    Disabling dirty logging time: 0.000614100s
>    Get dirty log over 2 iterations took 0.000068900s. (Avg 0.000034450s/iteration)
>    Clear dirty log over 2 iterations took 0.026388100s. (Avg 0.013194050s/iteration)
> 
> [1] https://lore.kernel.org/linux-riscv/20260815103245.864925-1-jinyu.tang@linux.dev/


Thanks for the detailed setup!  I bookmarked it for future reference when, hopefully,
the KVM fix is in mainline and then we have a way of testing on our end too.


Cheers,
Daniel


> 
> Thanks,
> Shuai
> 
>>
>> Thanks,
>> Daniel
>>
>>>
>>> This is only a limited positive test. A Linux guest is not suitable for
>>> constructing negative cases so I would not claim full Tested-by coverage.
>>>
>>> Thanks,
>>> Shuai
>>>
>>>>
>>>>   docs/specs/riscv-iommu.rst |   2 +
>>>>   hw/riscv/riscv-iommu.c     | 254 +++++++++++++++++++++++++++++++++----
>>>>   hw/riscv/riscv-iommu.h     |   1 +
>>>>   3 files changed, 232 insertions(+), 25 deletions(-)
>>>>
>>>> -- 
>>>> 2.53.0
>>>>
>>
> 


