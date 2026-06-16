Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED0CD98DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 00:37:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZHnU-0005aU-S1; Mon, 15 Jun 2026 20:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZHnQ-0005WO-Fu
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 20:36:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZHnN-00069L-SC
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 20:36:52 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65G0OSG02094036
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 00:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AbuYbK3pjxiY3ihwluJLqjh3Xg7cgM/OaetNnrjndj0=; b=hSgafwPl37ny/Su8
 t+HE7lynpf9f3F7m2e81oVqLrhaT4kXBR6YmqPHxwbS3YykD9cScefv9DlzL+KuN
 HH2roNavW133hS7ctewtz103dPZHO2M7uK4uYsnmt4gqGWBtjNYN0lRluNSMOM90
 cQ5TUrMj3p7dGJwHoVjmwDzUIjU4sQg5F411sgZAgNkvcR2Fl4wJmA95DR4fhW+n
 sgJGv0IJnHiW1lPVwQ6VmN94Fb8BmAoN9RT6DjdWDwY+/W00K8Sp8xmlyNO3L5PQ
 9Vz+UtnV6oH2wxhrpEWC7UKjyv7drfzxP6juKpDdFYvAgcc69TMdhUBKFFHuq1H0
 dCTtVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter23vcb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 00:36:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915f7c37734so865420585a.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 17:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781570207; x=1782175007; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AbuYbK3pjxiY3ihwluJLqjh3Xg7cgM/OaetNnrjndj0=;
 b=dbUrihnAs4+cbMC5EdFzvzsnbGlN8RsDeNvCrl+0kDcCJxPmN+5dZ+GYLfaErOcatW
 Pr2yx40G+iwhz58IglDVFDbOwSvphjETIcTNPvdF1b+O7tVQGWOgZXIjLhQKtDrkx8Un
 Q2c4F5x1CVmIfWJVqvQNgEFDma+l64ACm+juDYJaWk2ATih1tSZHRyMyL8QpJ6K1u6JT
 91d0DD8de89ab6mNG1YZYD5g/8dChMj7A0sFuxI1yVUwF5HCcOUhXDR8nq0QB9I86cy1
 4TeS+Btf8//s4QXEzD6qg9MSc2IR7wDC85Q59nkqmPF6cx+2QDIhivulStLAwBvGdutC
 TMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781570207; x=1782175007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AbuYbK3pjxiY3ihwluJLqjh3Xg7cgM/OaetNnrjndj0=;
 b=ZSHFV8zz5jDQhnuuYQhggxNoP5Aom04BLKyaiNtUhM4KE/dsRRRG6LKWXMzVpHqxpS
 /G3DnQHSWTFDL72BCXAAWRAPKjzMWlytLEG0jtmTHUdloBurLR7GGJkgdadh3b8iWm4C
 Iv/mGGTn8kOqLtQ6UCOI44yGtIAXV0rUbc/3iacgh2bZf0EF55M4eEUsLv0pcaRFnsdU
 RYRnn+McD+0ZPSqB2guHhPH5cr/sh2rr6E3MgVyFyGpwD69x7Cq7AAtV4kizu8W39602
 22FXSyoA8A8VM3AujSEvWy+7Lq5H2HJfqX6ff7wXhsiOWAXgeGc/+TcOPNNzCZq4F4Q/
 M3VA==
X-Gm-Message-State: AOJu0YwyiwS3cXFRsEeUI0dor21aYc5dJnabyZwRVDsSfJg8OXz0FvGj
 lJNJCvMB2QJ6rOPbXwkf2w8niMRPdQ2zOuaDznj5N9kkc9vfvFfYXLkrvX2AOdgVIYTuIUgagi1
 Mo+NWLXo5+IpFrZYR7N4d0ckxdoRsbVZ6UJPOh7U5wX0QSqlvX4ZvrmblGw==
X-Gm-Gg: Acq92OF3X2GEYkah+c0bg+Uy31iER3skXWWUIefeB/dajJSZt7vYac/YXK+5gFRUsQC
 Md0OGI8x17E4VrgTNF7eG599MS2JrKAXNarTXAFjdtqU79WSzNy3FWYqdwCERy/U7uXnoJU5Ut7
 NWVQBBbUafA+B8PHwabwt74tQ0k2y1JP6fl8NwI/F9UuFH5tenZoC3o7cCit5lPIIp8Qo6g2CFx
 mX/aoGbrjxjZZMr7vDBwIT1fJtYmy8JjEEOoJj+LyBhAReAMspTWRDZs4Zn2ImzPtyfrQJCq6Xl
 P13+wUaNtJaHAJDQvk77YEiwiYGRwINvMNFWb/Hiw4FVnw68BhuGiu5IU4vhHcCH6NWdSDKC8K2
 1e71448YYPECBtwX1eLcduDKYvqGweZ5erlEo3H8X5Z654SGSmlUyq9K6xf6NycwboiSAXjkG
X-Received: by 2002:a05:620a:2943:b0:915:e7bf:e6ff with SMTP id
 af79cd13be357-91c23c7bb91mr349921085a.11.1781570207102; 
 Mon, 15 Jun 2026 17:36:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2943:b0:915:e7bf:e6ff with SMTP id
 af79cd13be357-91c23c7bb91mr349917885a.11.1781570206693; 
 Mon, 15 Jun 2026 17:36:46 -0700 (PDT)
Received: from [192.168.69.214] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a45b30sm10436305e9.2.2026.06.15.17.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 17:36:46 -0700 (PDT)
Message-ID: <66c2731a-91cf-48e3-9303-8353c6be418c@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 02:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] hw/riscv/numa: make numa_enabled() public
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-4-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-4-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMyBTYWx0ZWRfXxCMQg3xdPPuM
 mFhIAHbNVhYbE2LvxN/24rG+9jN4s6JdtV4CYbh7CFGjA9ZpmjTW0BpQHso77riprJ+O8UbUAOg
 CcxAWony8GZzllUPptLa/Lbu4wfe1ck=
X-Proofpoint-GUID: cqZ36yW1jpZj-RFJBVwP-t2qZ4OCh2gm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMyBTYWx0ZWRfX537leYBIw7JW
 qJPCK+/WvlGNMCO1EOVIEzUBe5GCTYYA+4dNYUhkKWRhFqhIR7g3Q+eJymPWZIN9KNKVB13dhyF
 sfM3ReKGN4VnCXvDrqdIZXAqGAW3O2Q0OBq1mzs0ir67Bq3HRpHvQ0UMwilBp0XuWl4shoon7jh
 2mf6L5E5971v8sI2S7LcXFuCtOsO6mkMGS7ISIE/ltbK3tnFjGDdzzR4P5J+9rEFMSy6joJigXk
 Xs+48Tcnz37qJ4ceY0VEwSsN4vi+mEZDCHTT4N9W5pWlv0JNmtTQHlKQfVCBUmA7HAy3d2QpwKc
 LqIGF4gIvlgUCPD6DVVwth09YubkXQO79YIBIR18G20gvMNtCDkEeVVtxy3IcfaoprcApm7yxWM
 5kra5AnX+5kBmvcBoxDWdObGWbe9Cb5EymZDqagCjls/+TxWWAcMNj0n1gqUNZ+T5NZQRZVz2z/
 tnN/Tf992ekMIhqtnFA==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a309a9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3x77jrtbuF8AUm31dGkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: cqZ36yW1jpZj-RFJBVwP-t2qZ4OCh2gm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160003
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 15/6/26 22:37, Daniel Henrique Barboza wrote:
> There's FDT logic gated around 'numa_enabled()' in virt.c and spike.c.
> We want to move the FDT code to a common helper without having to call
> hw/riscv/numa.c functions from it, but at the same time being aware of
> the FDT changes if numa is enabled.
> 
> To do that the boards will inform the FDT helpers if we have
> numa_enabled in the env or not.  And for the boards to be able to do
> that we need the static 'numa_enabled' function to be public.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   hw/riscv/numa.c         | 20 ++++++++++----------
>   include/hw/riscv/numa.h |  8 ++++++++
>   2 files changed, 18 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

