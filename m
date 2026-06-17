Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0497CD98E4
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 12:55:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZpnK-0001fi-Ov; Wed, 17 Jun 2026 08:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZpnJ-0001fN-AC
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 08:55:01 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZpnH-0003o4-6a
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 08:55:01 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8Ufls1654299
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 12:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h6y+BJ/cQMMyqhId7tuAY56wbONoXd7cForu4LUQMRI=; b=TmUMifBywmpyAHW6
 YNgH3Xme51a9jW6WZ5BgHHabyr+5WY2Zmcap92fjqQCV1wGRhl2znqA5nLg5IHkL
 saq2taPgDd9BpWy8AvdrJjEwAUDGYKBQGb8RxslkSGROQUPhJP6rS5njel+OBSur
 BIHQ8FShONye0JJrYjF8Lt286osrroMSvJ9Zzu90tEMva2WRS+0Bg00p8oSMkV05
 NqBsbxV4UsoaDe6jD9e6VCtr6Ayv2rjRMjcDyNzmU2Gr0jr37NuZnhcySBkWqkSX
 uC0LaLU2H8cBdae8OZ6W/lU9Lkje3tZEwsp2i03Pt1iNt8Nw6PfmMQwCBZec7G0R
 IrcL2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer34dc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 12:54:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5175a1e32e3so147343611cf.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 05:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781700895; x=1782305695; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h6y+BJ/cQMMyqhId7tuAY56wbONoXd7cForu4LUQMRI=;
 b=bcb0j3erO3IA6bDZKU3iOGSMZCQbZlbGfih6kTos3dnLJnt9H5qxz8qCl8i6a4J3jv
 Md073LgFej7NR3pKB9s3NONQv2Djr1CghNfzLwF4TXRYITXZtioksx+lNmvM7mOlRcDu
 zsGwadChwCT93GnDPdiCMCjEviGhjkv4M6VU5Ha3JTdf2JrGetnCu8DSX7CB+eSnVqoa
 KcYyWzTlyGP3IiXaZKXVs15fNbHBjct9fXbFqCkMYwZGUeZsAn2hrlgIH5Yfo6XDewKf
 n2EsRIIhPgORP8pU1d0V8LuFZXJUnpHuech3NjIHB1lVcltB1SvLyVWSE5AIzfwy7bVl
 4C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781700895; x=1782305695;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h6y+BJ/cQMMyqhId7tuAY56wbONoXd7cForu4LUQMRI=;
 b=P+AWxXWZ+GPMM5L4k8mOFTpZK0PKZnngqxdvMc75TIAZL0KM2UcVQQJqInT42+2kn9
 mBf0qjE+MYs8okhEMKFOLNwvJhehjF+OEp6dbsViXVQzSJ/0eH/wWwufTwIy5Y0Ooa04
 NdVsUJJjSgszZFLe3T5nFfPzIfIQhQ60Q7689r8GqXAWiS31MJoRUzVylLWMTrEGvRpc
 +EYViUILWKMBYD4/+qoSRV2hN+EivSxLu1p6mmzkIq1ZkOQTxSqhnkSNwj9eOdu2khA6
 xeQ4lILcPeXIFetQZo9N5OyLYQf7G9/DMIrfgm0qsRq6cBkXsrkas90zLaDWrBKbQi+f
 SIUg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+qHD2lMUJl/4YJt29LaPyEuBODAJX6qdkn7dWfXCLpzkVjAAWrPwtg1msBdqZdFe1gJFvf/efgfJIl@nongnu.org
X-Gm-Message-State: AOJu0Ywpwj5sKmAbvWhTp5r3eUdUI9Q95AJY7B/e0mwbce/MIltiX/zq
 iLY7MKhPsv3hs6YjGSj3bkVcA2sysXXBJYCqVLP4qq5JtHlXoHy6bi+scwEp5k4VnqZUTfvXV6+
 fWfMMxB3bYiDRjyu8o/4oEsGbHMMEz1ts/LUniAr0E6o5kI/GQXmzGoYXPg==
X-Gm-Gg: Acq92OEbKx4EHbgMcfKFO9vKcSRcKxvT1j/JPpz7J5DdCerABCu3sNBXxBqmR6IwZpk
 qqtthSKPSbmb3t6es2u1NDMZmuzC6fXDoRj/9u9tZAgHgj6XQNX3Vfb3ySYlnKk3ulRZSUsvvdW
 zF6QEuW9t2azbOddK0ytZ2sMVfFMfBXdC7B7tURLsL/dx/Vm3yUiZtypUq37AFwuwjEAelQRHrm
 KuWSroAdRn750PHtvMD9wGJv4numLIO4BA318/ORAmYwPR/73lgl79OGo5+dFiljHJDjyXnCETT
 PDAFfHPS+w601wCaM/BpzIvlmPcomOdGwL73YtovnDQGICvYJNZLzF9N6yBvwz4oB/41cWm+4T4
 bf/NeMntn7m4imCLenmxv9JwjDl19Enyp2ci1PY1efzRF1Uk=
X-Received: by 2002:a05:622a:4a0c:b0:517:599d:ce19 with SMTP id
 d75a77b69052e-519a901afa0mr52113491cf.48.1781700895030; 
 Wed, 17 Jun 2026 05:54:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4a0c:b0:517:599d:ce19 with SMTP id
 d75a77b69052e-519a901afa0mr52113211cf.48.1781700894681; 
 Wed, 17 Jun 2026 05:54:54 -0700 (PDT)
Received: from [192.168.68.103] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-517fb7a00desm180182361cf.19.2026.06.17.05.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 05:54:54 -0700 (PDT)
Message-ID: <a7eb3b7f-1fa6-47f2-bbac-49316db5f2d9@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 09:54:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] target/riscv: parametrize debug trigger number
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, philmd@oss.qualcomm.com
References: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
 <CAKmqyKMUN-iDhhAF176eZsVsdDd7_-soL4CYL0vYfxGHkFEKhw@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAKmqyKMUN-iDhhAF176eZsVsdDd7_-soL4CYL0vYfxGHkFEKhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o1Pz-YWhggT11Tx-uyNR2EtErYkI7bFl
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a329920 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6xgfUjCFO5uoiGiy0l4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: o1Pz-YWhggT11Tx-uyNR2EtErYkI7bFl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMyBTYWx0ZWRfX+Mlh5kUT3bTl
 5QLEGlu1l1W3swDyrdhNBXtl7W1uPLoXueKS+ndTp3KK2sDIqa2NfqoP/ZEuQKcFpQJxwHubHIK
 r0FHKj5JEx0Lb83fDNYlB2M5gl8tOGc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMyBTYWx0ZWRfXwfqqtnVYDOBa
 bK620g0OQwaavUit+gmZ55ZjmMrmo06YdBulIDdRzCw2TAQ+QvID5H+RHOT0Rp8c1vNZtyXpIym
 akDrUmSRo1txvLFnvFvnC6bAoNyuX1J9A8g78bWW7D1ZOIy0Ns5vFfJ6zocmxMlbRPjlPED5yuO
 du4B9qm26HBGx/Mrk8vfsjRUnyfVZ/wfrBNC4UicBizxMy4Qiru2MYQ/Pew13cWyflqYrEvp0r3
 rxsE7Zn7nPtGGkRV7Of7hWhrOj1mJtlXxiWaoA0Mxs8yZPgKk/8fb1JQTXv+gnmk7BV0FSTzSu4
 CeV/+GSuY9QmAsJS31afSu19zYUbQ0pxe70gag8Pi2b671NmSzlhzqul/W/fvmedAV9lRS6R4L8
 MvN76dv9gmFnt//BxmFBTdDmjivqBXC6FQ+gawTenJDVNO73d+/+vasF0LoEJnKTO4/ljDw+Y+M
 P91Xb2KkpoLEH8ED09g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170123
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



On 6/16/2026 2:37 AM, Alistair Francis wrote:
> On Thu, Jun 11, 2026 at 10:34 PM Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>> Hi,
>>
>> In this new version we're adding Phil's comments in v2, in particular
>> the need for an unrealize() callback to free the stuff we're now
>> allocating.
>>
>> Patches based on alistair/riscv-to-apply.next.
> 
> Hmm... I can't get this to apply. Mind resending?

Sure thing.  I'll rebase and send a v4.

Cheers,
Daniel

> 
> Alistair
> 
>>
>> Changes from v2:
>> - patch 1 (new):
>>    - add RISC-V CPU unrealize callback
>> - patch 2 (former 1):
>>    - free allocated debug trigger arrays during unrealize()
>>    - change version_id and minimum_version from vmstate_debug
>> - patch 3 (former 2):
>>    - do not touch vmstate_debug version_id/minimum_version_id
>>    - added Phil's R-b
>> - v2 link: https://lore.kernel.org/qemu-devel/20260610205457.1868701-1-daniel.barboza@oss.qualcomm.com/
>>
>>
>> Daniel Henrique Barboza (3):
>>    target/riscv/cpu: add CPU unrealize callback
>>    target/riscv: dynamic alloc of debug trigger arrays
>>    target/riscv: add 'num-triggers' debug property
>>
>>   target/riscv/cpu.c     | 26 ++++++++++++++++++++++++
>>   target/riscv/cpu.h     | 39 ++++++++++++++++++++++++++++-------
>>   target/riscv/csr.c     |  2 +-
>>   target/riscv/debug.c   | 46 ++++++++++++++++++++++++++++++++++--------
>>   target/riscv/debug.h   |  1 +
>>   target/riscv/machine.c | 16 ++++++++++-----
>>   6 files changed, 109 insertions(+), 21 deletions(-)
>>
>> --
>> 2.43.0
>>
>>


