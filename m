Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AD7C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:55:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtGAG-0002zr-17; Sun, 09 Aug 2026 22:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtGAC-0002y0-HQ
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:54:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtGAB-0004TH-9s
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:54:56 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679MAoxg040515
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lzftzAbo4lH3YTjQtfkJSbwiwmb2QKIenjp1G6pbVzM=; b=caqo5fA4iu32asxq
 NTK2HzWMeRmj9p6SjTX7dqUoGibFT1uZt2fzI13lj98iLww2ergVjpQWEEC1c7U6
 hBsM15aGvHCwQCEdC0Hr1cjFa7nrsRCgjrZQb72F1QwNGPeN8Ex7ETGDkI2Cvzbq
 Uwvb0txArnyc59beHFyTwkm+94QdveAWA+np58K1KD/F8efLP2VLUfZDD5bpgM45
 bedtXPqzyOk4NJU6e6sWa9jekNkHBTvWLefWBJJDqJj4UAh9O15yJ/x87VkHtxuO
 Kz1GMGC0XLu6Dvz+RnyH0KZFQRfTi8trrt6XttDkVxoiXiRHKlOqDCh8yUDDt9S0
 P4khNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7c6sq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:54:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52ce3c7cb2eso25474141cf.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786330493; x=1786935293; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lzftzAbo4lH3YTjQtfkJSbwiwmb2QKIenjp1G6pbVzM=;
 b=FZWn4sgBezZXUljzqa0EB2O14LmTFXOjOIpfOKBFNqlWb2NZDZOFZGtlzVMHpXmgNZ
 js9ffXH16ARMTJc+nwlAzevsZZEx6Eu5ShFNBlH4PmABXZnBeOldja6GiUfuOl2JVZnG
 H+EesUcGF4hYfpJa2XvC26RA80D119OIf5J2Ac3BYJCf4/ig6/ET+7YKjjkngpf1ScEZ
 XhxsBnAAXoib+DmlwUP0ginr0VCQ6GJHoXONsU7YtZnl+Ktjqt7IZLOI8Q8/JajQi0ld
 Miq8xtRjh5iGvW9i5g+atvV6P61s8M9Pr9NJTOplKp3j5tElwYBYuEUXLkjatbYZ/OpX
 zIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786330493; x=1786935293;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lzftzAbo4lH3YTjQtfkJSbwiwmb2QKIenjp1G6pbVzM=;
 b=RttlyB2wCrfXjdHtJN5A8++yu6R9/avfEG8hBaJK4orQw7f2ULL7buDwLYiuHBklSe
 Zb6LGksIqvni+cUDh3YSht7WJ/YwGtFZYqMHQAgSb+BnUgXW0/CB3Yz500dvtFIPrWJl
 Gfo11gXdIqMQrDVNQ76Z5I8DGmjx2gjcgD1mUMOxTz38zodQfn0voTH4L6DADOaJcfwY
 qZ7/Sd5a2kafu4QWIuXFPZjGVGV0km6m93wby6+zYTVWHYy3O/Eec5pket3LEm6dlrO+
 flUXvUCfHa4r/Y5hqQPX0C78AWOZolge/JOzO5UK1QiqayiH6IzVhlS1CDTdfm3BhIJO
 +jQA==
X-Gm-Message-State: AOJu0YxeBwuMHaqFt1vnB/jQQDZfHnMJRJgQ/8VOHD/IckXztAUr5YeT
 /5Sm9vmKscOCAunjPA9WEHLheKz1TajvZ7uIUJYx/Pk9zy672ea+dF++okAVewBzo/4dnfAkzQk
 isFD36+fopwksMw3lVZfPGBjJYsRMYrfIvi4kdbCTNlJlSFXIgIjo2NMYvA==
X-Gm-Gg: AR+sD106XpauF93dAejBycEmVMKx5UGn0Bq5YOOeOOR9m1pCGExBGEKg//fORbaBBsm
 qh62A6M9HlU8VChzHWWO66U2s5r8kLS+WThmkdJz1M6ejqo3nOM1fOpurHgY5Kf/ZkEDImDP877
 a9pktX9ma4/KFWS3o7sa1WoM95zy5lWfVV+GnKlMw/TJ9P/UGNpaUep0+Lemt/uevVEl+tIwIVy
 xQ4FOU0TCFmOQhlD2QJFgsm4RLXrMDHqR/Dz0Qwgv7gGmZAyTkY/anjh9bP6EZOUF5LtqnPuq7D
 4xIVqTBx6nTMJSuKjU/egc+GOqjeYQLEWlxUO3urdpiU1scJGnlED65THoyjZ6j2Jnk4dObg+xi
 PG3RjoULWTtj9Jo2OlRmo1FXX3dlb7lbQGHo=
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id
 d75a77b69052e-52d0b193284mr313776411cf.24.1786330493631; 
 Sun, 09 Aug 2026 19:54:53 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id
 d75a77b69052e-52d0b193284mr313776181cf.24.1786330493299; 
 Sun, 09 Aug 2026 19:54:53 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995ea2d84csm216889355e9.12.2026.08.09.19.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:54:52 -0700 (PDT)
Message-ID: <e9b5dc62-3ba0-45ba-8159-54764ee7ed2a@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/56] disas/riscv: Tidy dec initialization in disasm_inst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <20260809223545.730664-1-richard.henderson@linaro.org>
 <20260809223545.730664-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809223545.730664-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfX9fKfUsSPzcj/
 URmT+YqW6qOuipG5UXs7ZegjredegYIDnI4fO4AukZKTHH2iTq4kLOxT1WIU5SLZfRnfEk4erHt
 9Etv+V+RcW5DNfebJtkCJY/+nRnlru0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfXy/QAX86P7x/R
 G2BLXa1F3kZ07u3+0VHDW9YHppmZusmRjA8UfFKbBuNTOwh1vVDI0wpqNFTMdHYFakHzF3bIXrt
 U5y+OXkECfMNBYEH0Q2ZwSrDkzw5aSrVdmh1GKlRQvBFVdBUFLWank0YVjx+vUSvDc59pEPqUQv
 eifBzKvE7/YDVN2QybyI0CIn/M8I2pMmEGlpfIB2NjrBK6CVlFFQof6x8hLErH3NixaJfn6DUhC
 z1lE0+4bDhRuXSgbci9MATClo1k4l3uXQ1/DRx/wUor3vTm4AazfMUzFYkwxT/DUUoPM4Y2FADU
 nVgASrrBRXlo4+3kLmX1sqt5QxZC4BUGJS3wqJrNAObYdli50v8XKTKX63JblknZUEW6vPmoswG
 UBvIWt01c5s3ieFWslxTMIrSGZX7zyK5kjiRHDZPEorTB78JDrfPjEJVpRdIAzI+1vMWxA6xMNX
 SIe/ehN9Z3wBYukIR+Q==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a793d7e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6yYFYDqK-0R5DF4W0j7Tchrcp1FtQX9B
X-Proofpoint-GUID: 6yYFYDqK-0R5DF4W0j7Tchrcp1FtQX9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100023
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 10/8/26 00:34, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/riscv.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

