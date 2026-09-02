Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDD7C61DD6
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:39:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1nzI-0007eA-Q9; Wed, 02 Sep 2026 12:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1nzH-0007dr-33
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 12:38:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1nzF-0000Ka-Ex
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 12:38:58 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682Ft8Xa1947861
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 16:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K3FzYttzXz9yCD2Z2Xx+n0vbxD4+LxbpHf+3nt5WHd8=; b=SCoWJcZa5JnsJitX
 15kkJAvaYmz50Cbqrr9fZrkfENRvgFt9oNiAao7cNktuqPEB8JtJFJwwOL9VkRbp
 lqBT1grOyrVyBkiZ3dRAueSfcSxC/o8lcT2xOUzDlVLij3VS+qbgp4KXAVoVt3hg
 LSLGWXovNST6lKbpCP0sqpZXtq8qKweiy4ckUy3uVXjp96kSr04SpBfUX4Lb1bGV
 liqtZrJTJW+Jv1cR0n1BdG7HJQXzVNLYsste2GLX9Cy/WkRVTOmDszpvWvq3fSTu
 AM6IomHgw67KvdUUJj6swUIFPfNF5m9H7dqvMn4oPa/O64edwK1/7v0A+bKMGaEL
 J35d/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5r5yw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 16:38:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936e393061dso194641385a.2
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788367135; x=1788971935; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=K3FzYttzXz9yCD2Z2Xx+n0vbxD4+LxbpHf+3nt5WHd8=;
 b=IVaFG2UArykcCdFohphlkCcisI8X9G+aDbWQVKuyGHXQsaV5B0ixAuU+LjAB9RrUtC
 YvEgNJCWP6FdkyLRhu6liurgGu/jguo09u8bLr8dW3UoSqhxzY2N+NwlCpO5Q/Hy/wRo
 IdygL4AyxCwLaFdTz6kTlaX9QHuYbOLKDK3gt+5vZWkwZ2Oxa8AmuFhjrFZOkNgFvPxM
 FgNc3EwqT2AZKTPxo/j5fjKgCuE7+dTsM4DuLPJWc9pXmHUbKZ0o3DhXGKf4vYs4XlKL
 FUNbpRzdpBrYOEUlE+uFIVMxR/ubghS2rIq3fk/L0wcTpRSUV/T8MZ/Ir5ukTnBByPq4
 zj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788367135; x=1788971935;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K3FzYttzXz9yCD2Z2Xx+n0vbxD4+LxbpHf+3nt5WHd8=;
 b=ROvGfdlcJ0V/xs7vR1+7nggNHlKSFvR3MzgOB7nCu/sdQi+IAq3tz9vvdwDzbQ5Bfw
 ABLKCuJHvUJJtQueeDNzbl2DrBpmE0faUCEaeuLu+priGhvZ04G5PwxmheAszJi8pT/D
 h0AyZzmvgqsis9QdrRlhJtUuNV/wqFgVbcz8XYH4AckDF782xv77TkKCMx4T+u/uiaaX
 mjAhIRVvfZOkZpV9H8h+xQncmDBtUttQwo4rekYu+t3/qoUcRznqSqfX1Xwp0f+lIRYr
 0EIT4twa12HCgkBOJxnhlZ0b9zWRtqnDOSWg0NNLhyx5p0aAXSDgaWZpEXpLSYmWQXf+
 0kRw==
X-Gm-Message-State: AFuF++lzfxz4a+8Y6ZRijozEGPCB93L/F3FDz3CgJz9xkl09I4eqZA7B
 6MJbjStTdxlpM8h5vCyY7DlzzGpZ4yI9ZRHs/+2eRdCeLb/XBvEM7w+vdik8I/nWIMUFwILrBQp
 F4n2m6VTYeA8Q3bGIE3E0kpzJCkD1BSj7gg0S2U0rQn35peBMORlzLyXGTw==
X-Gm-Gg: AR+sD10JCTa5pyCWjK4Ob2uT+PoLfwNizl+E1urOsicOXkw8iDvAZuU9Y2O8pGiuEal
 N6T1kpcnBDUm7PnnuBM44ITbrMDCI7KJkz6EzIVcDfuHQGGyrNL61OyhKGpmYGac2YtydCGWaj2
 syMyLyvwy8ClIRdEMDafWVn8ifvCOUj14n9Wsa+zZDvTXk+qLaBAKjRKq+XTmhsIfpqJ3erguYI
 IsiJhL/ZJiL0H5NhgRhgnScSTSL0hmNJXP/WeKFQPWfoKcUOzRUuStoSuTguBpmsgNh/5T/qT0D
 BBELLThwF/1DhZCRwtMwrs23XkhuBD7jxtECEtZXGCO7rGe9u8ysWRl80fSPn8hx1lA/8BB7A4d
 dQIF7XrKG5oqK9ZQTGT2hr/rNLrYmAFAlqT4F
X-Received: by 2002:a05:620a:6f42:b0:939:6dbd:de57 with SMTP id
 af79cd13be357-9396dbdde82mr83947685a.32.1788367134644; 
 Wed, 02 Sep 2026 09:38:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6f42:b0:939:6dbd:de57 with SMTP id
 af79cd13be357-9396dbdde82mr83941085a.32.1788367134035; 
 Wed, 02 Sep 2026 09:38:54 -0700 (PDT)
Received: from [192.168.68.107] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9395f39b594sm241808785a.36.2026.09.02.09.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 09:38:53 -0700 (PDT)
Message-ID: <2974643c-1e95-4cf3-b0cf-34a1ef3985cd@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 13:38:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/15] hw/riscv/fdt-common: prepend helpers with
 "riscv_"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
 <20260828203918.350131-2-daniel.barboza@oss.qualcomm.com>
 <cf4a29e2-20e7-4b03-a5d9-e8b0e39f44d4@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cf4a29e2-20e7-4b03-a5d9-e8b0e39f44d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a98511f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FRSEYCzRAAAA:8
 a=SUrE62rMcF1UMKfSMsoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: p171qiC4nFku32kyTpEzk0aK40EhU4Kz
X-Proofpoint-ORIG-GUID: p171qiC4nFku32kyTpEzk0aK40EhU4Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NiBTYWx0ZWRfX5NTNMbiHUkpO
 4xjw1JliNBBZFQdP532vFHuNEzB1Yv5g77ieft5OMcKe2uvfk9oEzgQ28pQ5vc0FrRV3/RDtfKp
 TxEG79P+u5LFiN473hvUlzmf1VKCJ9dw2kwJdbs78gvMnPWyQNiRmSnQWcsqjtOUBWqdI7CDFNz
 l5mH5HgdotT3AsVhTtzkLSdRy7OTV8Nrpi3ceTiplwqac1Is+5chtwEiK5v2vZBI0oLW8dPJthl
 G+FQzFkh3pcxy+hgUJNgar0H32V4r97N5hwD9jkBUTWo9Q/goGubPEdu7SefByHKS7NZIx3zvhZ
 CmhSfRYOTQtiotgfu6hFVVpQyLLjRibc28qjxSTWG8neQBebt1zdjBNS0abTXki2yZj8xiPkNEq
 Pbfx5jXTKbyRo8JWGvdNaTMlY7d3fPemSJP7iHRb9kBj0a8Z+NxQi0WomsehurpjJhzDlX56MNj
 /95IrIEte5HSnK/Y4VQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NiBTYWx0ZWRfX59ddJjeWvqM+
 IZUTHEv0V+y+oA2Dx0iDZw9JDHNng0xaP9wktbvR+xkF95DPMCJBRjZklWQdzDiIFmwxPEOIQxs
 NgADecPIhwdiZebSmQfa4ltObL7Wwmk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020146
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



On 9/2/2026 1:24 PM, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> On 28/8/26 22:39, Daniel Henrique Barboza wrote:
>> Given that the helpers are public API we should prefix them with
>> "riscv_" to avoid conflicts when linking with different targets in the
>> future, i.e. we should not use generic names like
>> "create_fdt_socket_memory".
>>
>> Despite the amount of lines this is a mechanical change and no real
>> FDT changes are intended.
>>
>> Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Chao Liu <chao.liu@processmission.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   hw/riscv/fdt-common.c         | 45 ++++++++++++++++----------------
>>   hw/riscv/sifive_u.c           | 34 +++++++++++++------------
>>   hw/riscv/spike.c              | 30 ++++++++++++----------
>>   hw/riscv/tt_atlantis.c        | 22 ++++++++--------
>>   hw/riscv/virt.c               | 42 +++++++++++++++---------------
>>   include/hw/riscv/fdt-common.h | 48 ++++++++++++++++++-----------------
>>   6 files changed, 117 insertions(+), 104 deletions(-)
> 
> I had the following patch tagged but it will conflict with your
> series which is apparently ready (and at v5):
> https://lore.kernel.org/qemu-devel/20260823150731.896-6-luoyonggang@gmail.com/
> I'll let see with Yonggang what is the simpler (likely have
> his patch rebased once your series is merged).

Yeah, I appreciate if you can wait for this series to be merged and then rebase
things on top of it, in particular because the patches are already queued

Another alternative is to rebase the prefix ACPI helpers patch on top of
alistair/riscv-to-apply.next, given that it should already contain these patches.
Then we could queue that patch alone via a qemu-riscv PR.  It would alleviate
the size of that single-binary series a bit.


Cheers,
Daniel

> 
> Regards,
> 
> Phil.


