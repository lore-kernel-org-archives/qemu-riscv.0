Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D32C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:46:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfbPD-0006ft-DI; Fri, 03 Jul 2026 06:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbPB-0006eY-5Z
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:45:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbP9-0007HO-LJ
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:45:56 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6639BpxC3694375
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 10:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ixg0UDTQ9MH5JgOTydO1TghSvE1eY1eUxTdbt14+/Ks=; b=pKjYFDkUswnD/VQ0
 JJQt3GSphNqYJhOOW1s6vv1MovD6KKFcVUdVL5YB5Cw05L2EpaCwOXXTvGXmYggK
 nTHmc/L/n37ebD9UxHGPvQ2zuNHWEI6rqkAeurS5QZNKZdBuUZrydErWgP2IH2Un
 VEj6KaTfKKg84Dnz/MP1O0hsl9rcQSQfRzOrN1+JLSJ4xaWMf85UXgLA/TWZ+JrP
 My0pmtODOI2nwqgGgIxN+msmN0emP896+wTZvdiTMAMajkWvINyy1EDZVdCgKjxH
 W5VQJfLAnNWXibIwv3THSoHkBTyH0tNLS2H4jDOrGE0s2rLar/5V1+wVK6rhvkjA
 /RboLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a848agq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 10:45:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e61b38eddso83381985a.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783075553; x=1783680353; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ixg0UDTQ9MH5JgOTydO1TghSvE1eY1eUxTdbt14+/Ks=;
 b=dumr17+kcFuSNrp1Bk2iWQ+5jq62YM4DViorwR8dMII3tp/Adcb//QbF+uSc1zB3//
 KHuJaqP+/QgGTX1/2l6OcVH2/PgTOw+Ahwi+8WqQgi9aq0YsIhhYlSZEQv4L6v4sDwyv
 b24+hvl31mz9Dg3VjjSJ/ILB7+NM2JrO8/GW9ibKr0epJKCwbJG1nEKSq92fnY8Nlt5m
 3onaBZDilNOWXFrBWhC1oHGmvyXHwsSYHrgkVeWmfAF0yVRl0gMTvUN2V/ViGx8fH3uW
 fTF4IhXLsmFaizFBOAgJK2okNDU9IJsT96oYR9lWFUKLAWKDvAwu+8sgN9VzTormHLJ2
 2Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783075553; x=1783680353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ixg0UDTQ9MH5JgOTydO1TghSvE1eY1eUxTdbt14+/Ks=;
 b=WQy0N4tJdR6yqZLK4KDbeUMBHVTkAdOJ40wURQorxPob69GiMjAVwPeXDrEZh2XCTx
 p4TfixFD/3XLjOWigihXPC0slhDHwXdWuHvTC5NpI9aftiCXGFouCN2PM/q1Ydlv08Uv
 Qpv/vEoRUlsP6HUqyjHBbpc38o+QHsGNONTyKlHPW188riXEYmr6en0xyjSvBI2JtsYX
 E3VzURSU+46CLOTRfnMmiVX1h0x/Z0NVPjXVGCToOWQg2ThRxqsTQ4T4lcY87+rXaLHi
 dK1gl1vbs1/dnJZiQ0AvNa8/ry8mTCwF4PuSU6B6C2eVBG60oeLYSvKPvNEG6tcLGPTN
 O7dA==
X-Gm-Message-State: AOJu0YxUeVk1DHiYoRgxuGWEvRQBZDhGwBhJFg6TP2FTEBBEI4DNEfRE
 oNHqPbGzn39tr3TELHoanpxFaP3eQIuEIBfGwrQQD6iIW0GJKATChP7t8z4QO8qiu8g2/ZDWude
 fdcgOqySOA8SCjrhR3LcIw36Kf7C3fE5FNw5OlZ3e4owH/Oq5NWk1L4W5OA==
X-Gm-Gg: AfdE7ck8WtukA2kooX8h6jlg4PPCHeoke3gdpn5ykz3mB/pBd1kBEYsuM9lDNeFyo2F
 62flN5lUu+dk9eTtUC6MZNxFbHp5rMHlnt6vK+eACOVh/STt8LBu2ahUV3QWRoSwPC+tvBRUGC4
 xz36/6MPnZmIRZ6jvoCfDyYpRh3ECPAS1EaZ8nx7BRSSdKoiC259aozr6Ts9c76SlSLtvYQsNjE
 /0xZYnf9FO17zuTe7se3kogMa86bM/BPOPRZ0GCDvl6QgLaB+JYt+Z/s63aHpbcPibJBoe5pZJu
 KGcqQRShZI6vvQ3wnR+YBYsWwetMCiRxi22LzqM69q0e9hxf1vYCzBSUc9XpQG42JAfcvRfkm7G
 Ig1efeKgkaclPXke0qulv9RX2iPx9Lhvkf7HcEwGKW7BeIyZD5ihm+0yCo/LuxA==
X-Received: by 2002:a05:620a:808c:b0:920:fa37:f249 with SMTP id
 af79cd13be357-92e78254b55mr1388144185a.22.1783075552989; 
 Fri, 03 Jul 2026 03:45:52 -0700 (PDT)
X-Received: by 2002:a05:620a:808c:b0:920:fa37:f249 with SMTP id
 af79cd13be357-92e78254b55mr1388140385a.22.1783075552556; 
 Fri, 03 Jul 2026 03:45:52 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bf11eba5sm133964855e9.0.2026.07.03.03.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 03:45:51 -0700 (PDT)
Message-ID: <1a8929a2-9adc-4b98-92e3-9544ed4d6506@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/24] target/riscv: tidy up riscv_sysemu_ops
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-6-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-6-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nk9L3__wdhiAJ03xuy6vAMj_r7Ou5ln8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfXzj9GzGyO8+SP
 zn6y44+cqrY6kwYhHVGrb9sgM8Bpo0ju9TF9LOdOgiE1oeapGJQ8UcNyOp2FDTlxFxjzIsjeBAz
 3UMsmwldyuu5XgAjDCn48jPdX8VAW8A=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a4792e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=kyii6vYQG7FJyop5uQkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfX9yyHGZQzAIVg
 zlGyP7n4jWTwap2Tpxgc/LiX2k8IqWJtAp25FqZ3K+d7RsGb7w03yhMF3ScM0XTKCSQmtIRHZTm
 enxNz2VRMD5WjP8k3uGlBcc+QavFBpgmkH27JDr6NHQthiREIIhXkHjTSWLsWyKRmAfQDyEN5Gx
 XBKhWmRKC3jo1rYI86KZcr9uX1KHVKwQx6JOP4NttJ3Rz308ycSreD6rzKj5j34B4b0GvrcmJfo
 zlHbGYPhJsXVso1dyB1nkuCj+kvwC9QfaxegnsOvOeUe/vVkro3OYZZs6MRYhWRszdisYQperGF
 On+ZPkFNbmUg5TTmVvR0lORzMaVhfk9XHdCuGFoGSF8ZKVrk7XXLMQZU5jXVqPJ1EhFUW/aeP/g
 KLXEYSH/HgbJhNTVUQjXlNbf8YkBdsTjKkE9Rx2e1Uw318k9P1T8kOSYA5KtrmffxW4U7rOpjQ4
 CmpADzRRxoZKXyE2VQA==
X-Proofpoint-ORIG-GUID: Nk9L3__wdhiAJ03xuy6vAMj_r7Ou5ln8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030104
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> monitor_get_register at this moment has a TCG exclusive implementation
> for RISC-V, even though the callback is supposed to be arch independent.
> Until we address how KVM is going to implement it we need to filter it out
> in cpu.c.v

"v"

> Same goes for get_phys_addr_debug - it has a TCG only implementation and
> KVM can't use it for now.  It would also need to be filtered out, but
> since we're at it, let's convert it to the newer 'translate_for_debug'
> API too.  Same restrictions apply.

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c            |  6 ++++--
>   target/riscv/cpu.h            |  3 ++-
>   target/riscv/monitor.c        |  2 ++
>   target/riscv/tcg/cpu_helper.c | 14 ++++++++++----
>   4 files changed, 18 insertions(+), 7 deletions(-)

