Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E728CA5FCE
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:11:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOzw-0001st-4M; Thu, 01 Oct 2026 18:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOzl-0001qG-Ll
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:11:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOzk-00039k-6N
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:11:17 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691Fscn62686757
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WJnir+zplbHriQ+7wsB+t4PtoS8ALV+KZNrg7PU7QUk=; b=c8lg40r73qZm2wcp
 BN3xtQzZLM5BUZBjsk4J41Z0TPNkYXCOrhjQwlNaf4SO+5VQQ4Ck9ONUJKXhh3QP
 ArP/UPUTlDhVLrTEqtA7fX3dvLAml8X5Brez5eBGwmJIDgpL3awkF1mu+s00CmX6
 kNrLAltMzm9ZjNW5nNy2GshqB+ZKI9MJCOLILcuMrTzFdDGn2rFS/Ld0rw/BFUba
 Qj9EOMJpvno/6GVZzZDjoV3G6uO/FtYGLpfzRBOnUaeyFL2XlLsRiaLHIyI/WT/P
 vNB9flUQuF8EH8bwAWEcIgxF3hkgP1fNTVE8v5mGwm8TpcpwLcdjGKArLkSTrOGf
 dT32ZA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9a9m9r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:11:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-34d62bb27a1so6659613eec.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892674; x=1791497474; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WJnir+zplbHriQ+7wsB+t4PtoS8ALV+KZNrg7PU7QUk=;
 b=GDbphxh1GV4x6CSqZWzsivJgWyL0bT+80DJt9btIF3Sbtt/s0aBy6Hze5t/AaODRqo
 6SslsQ5UIBi/1BzXqwGTDWEHZDiC3fwTw18vWTjtUDPkW248K2JlqwPojdYkjkHoEZTZ
 zLdTKcEQFjJFMVdE0FVnnWZ/gtF4gDUxY0yUn4qzLFl8wsxMT+4uTY4b3q6rgsO2b2hh
 OaEOznkWus5r3cU9dtpq+iJPsCeXYtFD4nEOLx6XNflGhCls2dI1BdkiDiahZ2W1Wh55
 9qtyzsthrkNRmnIFnKB+27p1TgMsil4dA8p+FkAf2/JPbGJSTsOVYV04Ag73vJgzhb9o
 Lupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892674; x=1791497474;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WJnir+zplbHriQ+7wsB+t4PtoS8ALV+KZNrg7PU7QUk=;
 b=wTgY5qzr/M8DORI5+HcpI/abUwZ5ViH++fUyWYMHn1mqN2GjJgyCBThT9hA3TVRii/
 mNj8LbutTZHwLdFDBM8f/dgafz81IoZdc31gEGHOD+jqzfDyRbrBFzvLeuvj+5OOehCk
 SzrVxTVFMCdmsBlcJtHbOqkFQco5Em3mJpGgqiIicOBq2D+k2rxCiitqtwI4OrFwsATE
 vmt/YgGHiAZzIyFy66QE9jWx82fJ1jR005MuJoLSglkVNjIBK0VTZ14eIMHD+iXGx953
 e/cBKfBpkwOkoE2mebMpM/mM3qnrWmthdow414pF1Buw/7BAm6IGzt7a/7Yhg3dps7Zv
 phHA==
X-Gm-Message-State: AFuF++khjGiJHFDDH0bfKgqO7TPAuMOpoKBljPbdZ6rq3nBbj+WOyRVD
 lmxD/QwJrCDBHRvvWtbZx9TNpXctQYcH9Qv75FOFTViuXUFTFk/hHZ+7XBKnwtw6EujNwbglQ0d
 xJF24LCPPh30QS/t1gHVRBVI5iBQbpk0d3Rno45fS6BglonLdyIbSp6HyRA==
X-Gm-Gg: AYBFou02AbkLtL0I5t3gDuUd2himZ6Ib03Nhx6cm77pLUg6++w/9vqFkB68i5iN++Yd
 mMMLTO3DaZKTMR7QwbcFo42H9qurjt4vbmxgadndiWG8zHMqoGgw2lKPbbOkNQNano7PVbC8ucu
 gRTr1hZ/32QDt0JpuYAw4uVgcRtInXdyL5QTU3O0Pdq63Udr/l4qbt6abJbnUJUmFqkikqKZ7Tf
 QIbdET0/3DgYWhYWI4YDrQ9RcmZJghmUb9E0ABAXXisYvZUznIuwuNfL9MxU++zolqCBJjkfHcj
 oqS4Nj8k48EK8Cs01BtyYFh2v+1jQ4kXLMsmcg25xixnJViy28FGEoejQkdmSM3XZeAuIdZP2wu
 z0c6dhLNiaIpIVax9RT0KV8OmX0bsC/KBfue4ezi4iQigw1nQTs+akVDFJk0AZZr6PPayvA==
X-Received: by 2002:a05:7300:8296:b0:343:ec4a:2b29 with SMTP id
 5a478bee46e88-34f150eecabmr779862eec.25.1790892674059; 
 Thu, 01 Oct 2026 15:11:14 -0700 (PDT)
X-Received: by 2002:a05:7300:8296:b0:343:ec4a:2b29 with SMTP id
 5a478bee46e88-34f150eecabmr779829eec.25.1790892673453; 
 Thu, 01 Oct 2026 15:11:13 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14fd4dd2sm1191383eec.20.2026.10.01.15.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:11:13 -0700 (PDT)
Message-ID: <c04a396f-cd5a-438b-abdb-de55d6193e90@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:11:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/18] target/riscv: Compile cpu.c once for system-mode
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-10-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-10-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfXzCTarESCbP3H
 ubf2+AS2YCsXU/j1WDQrhvVWm1qpGRY7J908LT5ChEBNYDNNHXRZO3S/FAd6EUQoDZ1SeU7Z2m9
 G48CRO4+mdKFQlP0nGAjM5g/q28XVg8=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abeda83 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-8lwRADQGCiaruQU8J8A:9 a=QEXdDO2ut3YA:10 a=VxAk22fqlfwA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ratYJxVprJDf9KeDAa8wIaYN-aGUZQ3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX6cRKGH7LEtKF
 2aj/izPn1vGlGP2VfEYhPuugdbXou+hivz4ymdEWuEaUrnmEC2AqnqpVPaYfYdAYODZFLDupQMS
 Md1lXLR4gD6T1Kr++KvlkxcGDUIxt85FQ/c5desSV3vwMdVKBBj7FU3Dhzp1U35y1mTMoqPymBN
 fBgas6iAgR2+gH5A54T8cx3/5MypqYtMZuqcgsq14OmaG6D302/pWVcWMKDUJFOteBX8ZkVbsB0
 lXd4RaSgmis3c8A4K6d3y7EyV7y0P8tXhN6DytSOtic7YDQkV2GFR8rXF7AmeHQo30xq6bxyLyf
 G/5QTlngKvMRoSa1WkE6RxNXqwuDAyKi4NnP1VrZbu7hc3gvInlP7S6UyePtmjZbV25XqA/hKta
 MZsuXoilvJELkfkucttFgSHLYd3+uNq61Hyut4QPn5Mzi10cq0QCZxyMSzZa18UJQnolLX3ucFM
 oCjmBsQas1GwDZVSqfA==
X-Proofpoint-GUID: ratYJxVprJDf9KeDAa8wIaYN-aGUZQ3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010088
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/meson.build | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

