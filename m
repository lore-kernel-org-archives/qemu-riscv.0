Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2637CCA6019
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xF7Ug-0006ZT-VP; Fri, 09 Oct 2026 06:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xF7Uf-0006Yp-Qr
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 06:06:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xF7Ue-00066M-0V
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 06:06:25 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6998KHSb642384
 for <qemu-riscv@nongnu.org>; Fri, 9 Oct 2026 10:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W+lHPM5kU/5vcT3S4xI/sYJZpBb3ucE0qcfIkau1g70=; b=Ah8CSSVEQ1ujNcmO
 mQ5yCuRFIRiYlLW9nrUGASpVuGTqwnwj4+x8o8k5+vCGkYfuCUNz+VyjhwB+eP9b
 m8fl2Hb/hmSs+9uyvLR+K60CemO2cSzsDRbVrquF3lC5HO8x2SmhqbHP1xfmzeJa
 A8RmEDx5nxof7/K8MPE16smXG7bqarwmAed2DSChug4s82sZN7xlTc955vcowcSn
 4n/AZ0/KLRPNy1qBwHi2KDFpLtsc7sL5CZ+PLbnzSyFtSwfvYi5Dpeeu4w3tovCL
 2iMDRdZxUtF15rEvlh1IIunegdL46KEQhKxpAYgBcR35S+RlwXGUSuesibM2Wv2W
 NDwdEQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxru24y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2026 10:06:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5ce86cc29c6so1418517e0c.1
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2026 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791540381; x=1792145181; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=W+lHPM5kU/5vcT3S4xI/sYJZpBb3ucE0qcfIkau1g70=;
 b=axIN/vFmJ2grdwYbtk/Tq1mX7JOoKDL0SkvbTQtv7JTX1KKC9QiKM5rPkQJSnJ5PKZ
 ch998aoz+NKHYxz497+Tg63pUA4h7fmJlBKHQ/f71NhNNcb8CSkc/HZBnXn94PPFc32K
 L9WKp8nrO3Zk+mF7ovIvlRiG+WGww6YiWJIOr+BwzhMadsFBeyuOlhFeIsEOKMbstbz7
 egpX13EK4gfTqRf82H2YdEWkFPoNhWDfOl2m8NMk/wYrgqzZctgaQp5wrhcS3iFvUrLQ
 O5eOIWqILB3jW/6wOFIxwLPkncSi2/czTdc7Uuos1Y+rGwcmUkVqZP75vPCVuWQ8T5y7
 VkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791540381; x=1792145181;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=W+lHPM5kU/5vcT3S4xI/sYJZpBb3ucE0qcfIkau1g70=;
 b=XCyQGNGtApi+42h+9jS0jV/ppAPRyrtPpSOjBf5pNUiJHXZS9pUoYH1u6akB8lNhMC
 t5E/7l38VF2hlDOHf5D2P4DU5kywEc69PFfUV/+hUU/kFtzna8JHl6QMcnqnq5Y7J/6k
 kcR542V3raaFwzgU2TEVjlcEiUuVOzODH/Yt+6fUOi2esd7GEYpf1OC4A6bBLumsnX0f
 0rcYZ2UrpXH+BLMf1ifKH+V3erdyY1mlMkKPAza9ibiQWRudDyIaWBZwNxWMc5C5UQeC
 N+yKPXeLd8OswYzNBsFmZVmgBbVyyinL1oh9GVNuyI/bp3vaZtxW3Li6HxzGAjAh4uPJ
 3ZNg==
X-Forwarded-Encrypted: i=1;
 AKwUvByEjt8JnEeCN4L22mOjBAEofyDrqsCaZ746mky74S8aABEiMKUb3S/PVg0CkrbaaZhmyxTMKTCo+eZa@nongnu.org
X-Gm-Message-State: AFq9FYK3K5ZJJRVE5m+5/Xq1ZEFPZJSZBlpL2a6coPVGu8sIHgSTXA0+
 ANH5q0xQPo6Y/WRos3+lj+5l6vBdXWz4NlAgjkCjjKvtggZJfhgCiV11C6aUYfuzx2KyDlY7VXo
 up3sO5E4sslJ22kh2/IaZM2GOmjY/m+7WHTFkz2FGUKc/sNiS7BTKkpHjnQ==
X-Gm-Gg: AYBFou2ONUJXTQAGAyYWrWFuUmNyHx9tUXiMP09+I46eaF4WC83icXRLoTfL+aL3Sma
 K7Fh2tNcYgtCRGnzIDLnHhIuoQJs9eQF2PQl45I+lRYY3q14mlwuQqITdo3YofwQUSWQsn9bvjZ
 hFOSQ2+YAX2sSUFoHFo4m/loCo5a73bZ7HRuv0OOhg9dn0LRbFMP9gHBIITaejGLJ7yE9kO2B/1
 QWVFWqQxuQPX5pgH4rzgX+qiBZIDOQI5aeco2DFq3HxYzttCl4mLtaPRuTJG/QMIYddpvLZ0to7
 l2v5VBw02T3BecwPanW22BNfvsbyUWM308CMOlstpi4AP69rtEv9+jjsQp5Uwm5eGuW109+Ag6T
 me+kTIfWAQ9j3av+T6M0JnQm+eFXM/Gi+vw==
X-Received: by 2002:a05:6122:3d13:b0:5c9:a60d:3277 with SMTP id
 71dfb90a1353d-5e91f4bd146mr365703e0c.11.1791540380686; 
 Fri, 09 Oct 2026 03:06:20 -0700 (PDT)
X-Received: by 2002:a05:6122:3d13:b0:5c9:a60d:3277 with SMTP id
 71dfb90a1353d-5e91f4bd146mr365682e0c.11.1791540379686; 
 Fri, 09 Oct 2026 03:06:19 -0700 (PDT)
Received: from [192.168.68.107] ([187.10.234.20])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5e91cab57c8sm1318540e0c.5.2026.10.09.03.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 03:06:18 -0700 (PDT)
Message-ID: <67cb8199-17ff-4bda-8115-48dd16b23d97@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 07:06:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] target/riscv: Replace gdb_get_regl() by
 riscv_gdb_get_reg_mxl()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
 <20261007232326.66240-9-philmd@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007232326.66240-9-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8bc9d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=jbqyKmyYbxlRs/MVMa3Ccg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xeZyZPjq7wcwBkyzFCoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: XcvxF2nVT-xMNnr9pXrydT0SXBl-ssLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfXwzwxPmhplYrA
 ZI6Aw/gy4VMw3Id6/ZtlFJGEwTRmRavWB2TZdBXz/TrpceD02z0Ku3YGQEcjhQVsK1h/1Qr38jS
 RKRzPCQlJ/nb4a4CfeqSs+u770lmSc7VLBAFF1CObeae+MBYrFdKlRvE3HTf/dg3fCdv6QBOMry
 FoCP0WyfkotzeKbJ6sMLLkoCghZVIns9OO+Qm9Kbd0/JNMShTIysSD2dCkMeQIL9DG2/cYlL79q
 LYciGguDBrn6VA6L7e5SbyKRclfwBm5U7hWLw4F0+/cw3zjK0I/jx08tloADX8qglx18M3mWR5e
 4pc9MCqBb5vzi66RVojpMkXVWvJjTFOhPmk8+aYOi5kcP3peMOZcsN/FBUwl4BGeAS6WEp2+EPM
 w6OYXtvp59gpkMHV4wMEqJvi3FOFbCL7J8VQ3CSf8c0RQxphHSHrenOdBpa4l0zW3LaI0JxHZJo
 waL3sJ3Nc/45zDGtL9Q==
X-Proofpoint-ORIG-GUID: XcvxF2nVT-xMNnr9pXrydT0SXBl-ssLd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfXxeyR3Qa4KJf5
 OpyGBkl1g3xP6cQkkDXgtINlUjFrcFR4uAZwATfLK5MMDNkI1ulDefP2NL8+XbE81x4umBcTxpM
 tuu/V6URngA0hQ0AGas8lik1+/bhhc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090040
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 10/7/2026 8:23 PM, Philippe Mathieu-Daudé wrote:
> riscv_gdb_get_reg_mxl() picks the register width from the CPU's
> misa_mxl_max instead of target_long_bits(); use it in place of
> the deprecated gdb_get_regl().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/gdbstub.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index b3c11db5397..50e834e367c 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -183,7 +183,7 @@ static int riscv_gdb_get_csr(CPUState *cs, GByteArray *buf, int n)
>   
>           result = riscv_csrrw_debug(env, n, &val, 0, 0);
>           if (result == RISCV_EXCP_NONE) {
> -            return gdb_get_regl(buf, val);
> +            return riscv_gdb_get_reg_mxl(cs, buf, val);
>           }
>       }
>       return 0;
> @@ -211,7 +211,7 @@ static int riscv_gdb_get_virtual(CPUState *cs, GByteArray *buf, int n)
>   {
>       if (n == 0) {
>   #ifdef CONFIG_USER_ONLY
> -        return gdb_get_regl(buf, 0);
> +        return riscv_gdb_get_reg_mxl(cs, buf, 0);
>   #else
>           RISCVCPU *cpu = RISCV_CPU(cs);
>           CPURISCVState *env = &cpu->env;
> @@ -219,7 +219,7 @@ static int riscv_gdb_get_virtual(CPUState *cs, GByteArray *buf, int n)
>           /* Per RiscV debug spec v1.0.0 rc4 */
>           uint32_t vbit = (env->virt_enabled) ? BIT(2) : 0;
>   
> -        return gdb_get_regl(buf, env->priv | vbit);
> +        return riscv_gdb_get_reg_mxl(cs, buf, env->priv | vbit);
>   #endif
>       }
>       return 0;


