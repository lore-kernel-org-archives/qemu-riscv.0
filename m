Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B01C88E75
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 20:40:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6Zwr-0005Od-LK; Tue, 15 Sep 2026 16:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x6Zwq-0005OQ-77
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2026 16:40:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x6Zwo-0006Yg-GK
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2026 16:40:11 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68FIthj53342254
 for <qemu-riscv@nongnu.org>; Tue, 15 Sep 2026 20:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DTSpDyyhMeaRp3+b1u/gwYr3WghI8oagLMKbTS+vfW4=; b=g6uEJp2JL+DdfIIg
 Kh20LzkGzZrdznSZKhvtvhCaqGcPMFP2cIwWYko11ampuM45Qt+rTk/tVtT9KYRi
 X3jhxGhFeaWxEqHh+FtiyO9jSYbJUBoNqB/y/ugt6vBYbFdCQtNvdTn49j1Ve2Rt
 OT5qBBb2eYLmhjqIHfT+06E34ngdPG0Ua5n9Pdfz2YglofZhpoQ7/ggrgQSKuICm
 ICN+srJ+tz7Zx3jpsLrBUi7Gv+hWoJis2wigDSTKoY7rEw1Sq/meY2at6kAoF1tQ
 CVLrWU3t1qYYtYUvEAun0zo9uPVfkxJymGb5g5DeEqp3YR0LWffb43rwP+vbXJOD
 Z9oi5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpc4je-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 15 Sep 2026 20:40:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93a1bffc2eeso750395885a.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Sep 2026 13:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789504806; x=1790109606; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DTSpDyyhMeaRp3+b1u/gwYr3WghI8oagLMKbTS+vfW4=;
 b=RNAhnaHq5GGj5wmfdL7DtZiA/Ba4CiJpF00BuesWHupQVBMRbJjk5H6KwHMXESDhsu
 2oufLmhTIi1kyYKPJTBKFwjHDTGDSslKhmD55m0CmpWly8C4EBDCfYnZbm/qY0R18tJO
 KA96GQ5oJ/4fs7DneYJJhxgrF/9FE1kNXxxTzUizGyu3kVQXSOr8GU398dcqk1gWbHvD
 NHLyOUmNY4WR79dbr7jnoL1yhgRxSJ2yH4ZyengAj9YmhBajdme1SwFlRO/7ty+F1374
 /QLqdgawZ4usfma/JlK/Oup05inTXI7ZVDV3sR3qU0qKKsbCC8mdesg72797v1QvvVSb
 mz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789504806; x=1790109606;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DTSpDyyhMeaRp3+b1u/gwYr3WghI8oagLMKbTS+vfW4=;
 b=JicWFurADO3ITHVIUip6rJPUfwjdmJMXTnv/Mc3AxCTA5H5iS3dpG9j/63xgKFnDhn
 Ze+ky+njb5AipRjoiWaiVKQuqeRC7NdHmF2yPNi/8vs20b8xkWFjBG4JeSdUZSsu61ev
 z+dkrHaVShaKZa36cHq8A37R9x459MQsLXF+7G1wW7gIFSQZ2m4E//8noHJkdYc5f6GN
 Gf748qqo/ZZehfA/M4astmW3/EFiJuvEoZxxIzUZ/faasiQwXQ5Z++4Znx4E6R8wVAU2
 pPi3X0MFiHWz59r/Ezj/fFJ4YU3MwfeecbFuQt3Ie2O+ZALiWiopDzq7OvCN4dkbw21B
 3sMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBygnyNl8149fEnYZax2lXz6pU5hOdKzQUJMv48DJxWq7+eL3Gjgd8j3lZ4Cb6D09qsLL8BqJVlr+mt+@nongnu.org
X-Gm-Message-State: AFuF++kNIzunroLSkkPyVnKkPhA29QS8e94vAbtY3Rpt5K0aK6QbArhJ
 6c6YT6lmEtCBri1yJjtZ8r8vd/81v2QIMCG97uA/1icy/vV3gdhWmD1hOs3XWXi2SGhDZBVA3kE
 4OXtQi0osIyXxqDzYfRa85bU5TuCfozmBbTTNNwFbtTJlkEgFtCMD6E28Ng==
X-Gm-Gg: AYBFou2zNQXpnfQyRr/azOIB4aFy/Jz9o44FoP4x9pEPU/zz9poDAtbfLQiUnLuwlsL
 xqSVcc2iuymwDnWpC/h0WM8M1k7EEHOHxWCUYpkPKqaDN+duDDPNRK6fe1dCH1Hqf+1sfCg/Ee6
 lGkH50a0jCq8YE3VVy9t7x679FZ3jnaRD2h1KSwMz/2P6EzyQsJpK7jaKSCIqSKOt60n/B/HNar
 z4P0mWE1Upaci/4cRGH52wp/UbWc2plgwvuPKHDzg7i+9LAArljp1a8P06TFTEmPL8TjSdoDbat
 SktJOLTrDTaX7Fmh2YEG2bpWlAscEDKhBa8SBRmYyou6DmVmSP3vLU0uQ2RtwSt3dz7eZEaPo/B
 wNWjKimUEKRrf4GQqof3rrsrAziDiN708t09wqA==
X-Received: by 2002:a05:620a:2697:b0:939:7f2f:b17e with SMTP id
 af79cd13be357-93a299491dbmr1273382285a.30.1789504806270; 
 Tue, 15 Sep 2026 13:40:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2697:b0:939:7f2f:b17e with SMTP id
 af79cd13be357-93a299491dbmr1273375385a.30.1789504805797; 
 Tue, 15 Sep 2026 13:40:05 -0700 (PDT)
Received: from [192.168.68.102] ([189.110.107.170])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b81cfe364sm43269985a.40.2026.09.15.13.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 13:40:05 -0700 (PDT)
Message-ID: <d4535ac9-449b-4829-a0d1-1eabcfc2c08e@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:40:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] target: riscv: support TLB page flush for
 sfence.vma
To: Richard Henderson <richard.henderson@linaro.org>,
 Trevor Gamblin <tgamblin@baylibre.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260904-riscv_tlb_page_flush-v2-0-defec3f29312@baylibre.com>
 <165fb72b-3cf2-4693-88e4-f9d36c5c498d@oss.qualcomm.com>
 <19735ac2-9357-4d17-847e-672781539b0f@linaro.org>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <19735ac2-9357-4d17-847e-672781539b0f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMwMiBTYWx0ZWRfX4pOLfljz34M9
 atJmDCLSAwUv9v425n+hrnD3SMYUYSsjjgIEtfIQDLU8gZU6O5oTndEktQx1IFQ3/mgYwg8tAos
 RptcyeQmhHjosWzDlOTlEjo2SwJD1jc=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa9ad27 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=arNgJ3JLhM/z8Vk/iMOFgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ux0HaAIcEQ9x_9cGLTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mBzjTnR5_UfJePn3TZ4OyrYNx5veYRty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMwMiBTYWx0ZWRfXw0aYg3dIWWVd
 ZaxHaDZDBuX1lw1cBzkrVkUgTl8GVBqqdOPpE82/sFvA7+ZdRHES2MumwCdYLxeKHGD/OBOkKbJ
 hHcki3BWhw1dPNFmlDVqSNKdBNHk+0gGvfDNr7ZTyxcF/5hX4GF3RWXjG9ldj8NXD2kxs99FKLv
 eBqbvzNJF0Dwam+RKKW4UwbTskPI2vrSZzIkJZ4puMtS/CJGeyysVQT63+hJCrwhZgCe4KYvKi5
 z9TUnzBn06CiySrmEUHDZ4+iDWFdc2XnXuCS+Hb3kpk32nlcFJ3XOxYquiUBab4Ro7LFD1wOt/c
 SrmCHrUFOiZ+kfZLzF0891XsJ0srX2uF1U7fNm96BeUL+NA2p+zdWwpMvOp/V2rQXCFGB61du2x
 AvhpxvKqGzlrTPdsXpnrM2eKc0g00rrAnGrH2gSclJKEXjo0vLVjceZcYlUM6zP6QLIJndAxk91
 T0m8YMDDkA8a/TEbujQ==
X-Proofpoint-GUID: mBzjTnR5_UfJePn3TZ4OyrYNx5veYRty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150302
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 9/13/2026 10:14 PM, Richard Henderson wrote:
> On 9/7/26 03:14, Daniel Henrique Barboza wrote:
>> Richard,
>>
>>
>> This tlb_flush change is giving a +20% performance boost in riscv64- tuxrun.  From
>> this:
>>
>> 23/23 func-thorough+func-riscv64-thorough+thorough - qemu:func-riscv64- tuxrun  OK   92.71s   4 subtests passed
>>
>> To this:
>>
>> 23/23 func-thorough+func-riscv64-thorough+thorough - qemu:func-riscv64- tuxrun  OK   73.45s   4 subtests passed
>>
>> Other tests weren't that affected - I take it has to do with the amount of
>> sfence.vma being issued.  They look fine in my own testing with an emulated
>> Ubuntu host as well.
>>
>> This is all fantastic but I wonder if we're missing something.  If you could
>> please take a look at these 2 patches and see if we're handling the tlb flushes
>> according that would be terrific.
> It looks good.
> 
> The only possible improvement would be to avoid flushing the PRV_M 1-1 tlb, using tlb_flush_by_mmuidx / tlb_flush_page_by_mmuidx.
> 
> You could also rename MMUIdx_M to MMUIdx_PHYS and use it in modes other than PRV_M when the mmu is disabled, simplifying the test at the start of get_physical_address.
> 


Thanks for having a look!  I believe we have a potential cleanup to do based on
what you said in patch 1.  Probably follow-up material since it'll be a bit
too much in the context handled here.


Cheers,
Daniel

> 
> r~


