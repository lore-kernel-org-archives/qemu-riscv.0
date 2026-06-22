Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F801CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 21:03:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wblmx-0007Cj-US; Mon, 22 Jun 2026 17:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblmv-0007CM-41
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:02:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblmt-0000yI-Ge
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:02:36 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJbUcW1903597
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MDg0ga2nuRYpj+V679c+pidw3lqSC5y272juvl2k/4U=; b=F65umBspntnmmT2L
 Xfy6QTYrwn84Y+QR96zc8gpRQVghf+tvpVL/ooV6a8PoMrMp161UdYlYMNrrzPbn
 +HpXC92x1afmdyOXmdUyQiEk7k/CLEFyru9zl7F60m3EwKGkWPGZI4P69l4Tuqse
 rtRREuBoFwOc4iZNAkkkDXZNVD1UPWmqH0tM4gGE/8zrx0pRoFwWAug9fYUjh7/8
 qqy98gyJmYeYuVMCJYG/VIVWup7nhGKBKBHqME6pLPSAvgSWMznmpSDhxQZVQoAK
 8rJz8ZEFzGvXqM65sSCXEUcM3VfhAgmOLjeuEIpurxZSAfqrFnUj+DBRv1via5pH
 2/b6Aw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1uba2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:02:34 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7e71adbb398so9856016a34.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 14:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782162153; x=1782766953; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MDg0ga2nuRYpj+V679c+pidw3lqSC5y272juvl2k/4U=;
 b=Gu7tmprGLnN+CNA8hG76bnaTtLrYaw5PLFaLVTezY9w6BV96pjdqIowKnv30eZ3ZAI
 7pHZBwlxiA741El32z+CsLLjfuebKscOPM8CrdkgwaEjhMVX7MCQNM0/CYIXGZzwEdws
 OHwLUJ+vtn+YSic92klQ+eTg0M1rw2s2HV9PjRrI56oNC+qReozSpudp8OWMDgmeYDub
 Oe+iK3BQ6v+6wPZ+RDTPzfVPwr5I1llZxx0oQieXowVYPrRbK7Y9klwv/7h6b2kwHon7
 kq6FVsRQ831JhobZ50DMwAlIz5j5V6gQIUjcV/goiYOfnaqPSCr7e+h8TrFzLwO7AKOt
 bYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782162153; x=1782766953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MDg0ga2nuRYpj+V679c+pidw3lqSC5y272juvl2k/4U=;
 b=FGOIpz/HzAp7msuko0CLHbgtnHpJHMBnTNKbPDTTFVfUF1VseslIEqn3d6uIuZulih
 As9NtPVVLbDawXZudVBKg+D6KPXY1lm74ohzaAednpZpog1dc6Ufv872ufBDn091MpRO
 JEvvJtABoOtKC3CSmbMW6BoMJMar5BfPqxKA4QDRxfo/jEPydApOcpt9659ry6pn3NHE
 prX9kRDBRpYOuTtvgLD5l6neg54iyFpN5JZa9SmiSxnZaKb/zsi0D6rRzniqSU77EnTx
 VcNpcPBpkGBnSZEUdd0KFOzJAHy4U0cHLSSvuG2ZdMeh7NIymsGoOCGOECWb8ORkuzPo
 xM2w==
X-Gm-Message-State: AOJu0YzPUTAG/1pLgx8Wa/TPgn1RKZCQzicub9asFs+6zfnH3zZBfbcd
 +7EnwSdt2Lsuroq3u3Hchs2dHmw0BmwjSZacXUqopxOWZxaSbMgInjvwzXXrLyvvQcMxmP130fi
 mU6fxxZxYlP+T1fxyzooH7Qv4P4ikKQjf/SanAkn7UXRKKHIk9KMobb8eoE4qiAx9kBO/
X-Gm-Gg: AfdE7clvRlxVTz2+yEPco6R9Z8N0ltK6N56x7wQaMgFTfdnxgD8ULoelROeGXdamsSu
 6MAhHBVFsdZUXruzbiWdyY8UZJqhSnyp4fmU2hSZivkdVy/CLn6OQTZjd2c0ekLCkzPYFLau3Jb
 WgmcarrrFR56L9IvWWRN9b+tnyV7u7m7CdxS8jF1rOOttB4zqPalNLTHhuRLFNYSAyacRY2TBiY
 Ds9Sehszw0DFspP+T2MPeAJaO6uECkA1Xf6r0k1bicv8SXkqEwp0T00arh9MUDmtbyVq1SmUMpn
 tB1a/MnExmvB3tLSB5+lcImBAjpXoguo2UId0iGOqR5XLFqRgbKaNTK0d3HKwJW/wkEJuTnH/48
 oJ3lSZtEy+0Lg29ahYS55FSunilPav99RLSArpYr7oGNdHHU+/YfHQGYIsQgZIg==
X-Received: by 2002:a05:6830:358f:b0:7d7:e142:2ead with SMTP id
 46e09a7af769-7e92d9e0d6amr14519905a34.20.1782162153525; 
 Mon, 22 Jun 2026 14:02:33 -0700 (PDT)
X-Received: by 2002:a05:6830:358f:b0:7d7:e142:2ead with SMTP id
 46e09a7af769-7e92d9e0d6amr14519846a34.20.1782162153114; 
 Mon, 22 Jun 2026 14:02:33 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666788547sm30876882f8f.18.2026.06.22.14.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 14:02:32 -0700 (PDT)
Message-ID: <755aa324-6792-41bf-be40-ae2155fefa27@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] target/riscv: move custom_csrs logic to tcg-cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-11-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-11-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FkydQ7ivvyeHeMqi-CbJuOAWj5Y6ZFks
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a39a2ea cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cI9PeKfKI65uTIaYVYsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwMyBTYWx0ZWRfX5RYGVp3tOy3x
 s+Hkh8ezDm6ljCUMcPNAYJ+BkSlOaZBdgTk3NCwJRF6oO7gwr0c8YQ/R6xjzGAr6NqKh4CnIM0N
 Q08ZjxSRHCp11XZ3NPaWG0py8v3smdE=
X-Proofpoint-ORIG-GUID: FkydQ7ivvyeHeMqi-CbJuOAWj5Y6ZFks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwMyBTYWx0ZWRfX4K8ybmTuVysT
 Ym17xxt7TlucvcVBg5sQOqjkek6zRGZX/HaO/2pgEhKZhdvGWrAb0O+3EC6geh4rsjxSOoh9dt3
 y9VR2WMX2lhcw8CZlY9IFH1IJ9OODZtQN5aMB6vF3XA04Xwsx+UHjjtspTwjFTDt7eeEKFCcShT
 z2IXU1E3WKah2rMyty4NpCPpMU0to8dFDF6rw72RKnz15UoE4RKMXhDD7yEbsc0ticfUJJxkOz/
 hQ3RJpkZWBgMoRR4+LUy8zE1MxF06mPzWPOzCIBjtFKp7nps6nQJmD8knp+4w5kc3eX4NUq29og
 k5Q78d9kwmOGrZcOIKrvm861Y5nKizHeoCXCM1SxFsi34o06QiBG3GGczu9LA2LGHHrB4n2AptT
 8RpzCinH2XLJN2gRcZD0IgOs7NeNxCdq8RnxrbshzeUcI0L+ns+rUnF1JJT4cEp2lKO/SNOdCg7
 WzVgwYYl7hTj/qCtPHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220203
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> We have a couple of CPUs that has a set of custom CSRs that uses TCG
> specific APIs.  Move the related code to tcg-cpu.c and do not set
> .custom_csrs if we're not in a TCG build.
> 
> What we'll end up doing, sooner or later, is punting all these CPUs to
> tcg-cpu.c since they're all TCG specific and KVM has nothing to do with
> them.  Another time.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c         | 24 +++---------------------
>   target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
>   2 files changed, 24 insertions(+), 21 deletions(-)

Squashing:

-- >8 --
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7582874c351..4e58a5daaba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -570,7 +570,9 @@ typedef struct RISCVCPUDef {
      int32_t vext_spec;
      RISCVCPUConfig cfg;
      bool bare;
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
      const RISCVCSR *custom_csrs;
+#endif
  } RISCVCPUDef;

---

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


