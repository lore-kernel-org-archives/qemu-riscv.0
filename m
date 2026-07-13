Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF24C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 16:00:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjJ4R-00018c-2q; Mon, 13 Jul 2026 11:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wjJ4P-00018M-LS
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 11:59:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wjJ4N-0004VY-K9
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 11:59:49 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DF8lc11908370
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 15:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5XGWAXlmBj+DYiOqhlUA2DBl6zFdr2IWLooI5QodJ5E=; b=kCwZJ3af5hsiutWH
 TqRdqNf+5vOVW5eVEN/nebQu603RhgwILnKwJi6WrirwxwldPdLVsowC0bWOTqez
 TO1NyHcc18XEoRNpBMrChrHgikSMblxV3CQ+JihooBe6W/uVbWYL5ix9oYRNOBSk
 +c6AVkz+n0qh0R4VGnaYhVqhX7UcwTxptU9GK5cQ8TA+x0Hyi80jomrEIG1i54Pd
 bAgM6EsrsfiJnMJBep8vyqjQs96r/mjq8wZWS8vlBC989Aqwdid3VbTrj2A+FPhB
 XzsjsysN2hgzvB4bycK6TluiqYpTrN8nLmdhTztjAf/yZcjrf6IX5jK0I+ssPLpR
 mdAA8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda1hxk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 15:59:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c894c1c4aa9so4848487a12.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783958384; x=1784563184; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5XGWAXlmBj+DYiOqhlUA2DBl6zFdr2IWLooI5QodJ5E=;
 b=gfhVdWIZEJUuTKUIGP/2tqgefAX8/Vn8etxH4fFMLTqJpRPHPm+OGtuEYF98aOH4+Q
 pGf/SW3UUzrrEp7f1CksVQz/mUU1seNa1inZDPPCu1DRXn1NKEX9vfv6uGUFZb1TuLAA
 sS6HCj4RHzCfTBFXZCTwTI24sxZYFtyu5Q+lWab1S/0xbCqOD+PVG4Loms/Fq/c4Wp6N
 4eP+/CwdIbCJDsapUID5vGtPJk/prWhT23+1NklrxtyoKg0wWTXEzSGBFdoj2L+DO6lN
 KbCq5hhQKVrJUO+m59iIp+UBQTy18TKifbzMAkV7GZQnI/0ehaZqY++EnxYjdasAa3Vv
 /HWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783958384; x=1784563184;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5XGWAXlmBj+DYiOqhlUA2DBl6zFdr2IWLooI5QodJ5E=;
 b=mmYhzoQrmC8YnA0E9fxdlW2suNYEtqR4MbUypum/wixZaAMoGggoD2OcgYi0x69GuB
 eIqPXDWGQxBvqxUeZK0lXh7PYrqPoaXEhYIpwjkLD4KKPD3oa9t4EJ9Cz5h8xtYOQXHX
 2DfY5aYjwYWhMw0CQd1YTBL4zl8D5lIllZ0FjXYWPO3k7a9+SQ8pUU6BSWdabTprwsdI
 UDHT8DABZjbpR8yPtDdtBUwFN7r5iS76jJjIc+K7o9MYYpaL656b1B9ZPM0QTjQI5Oju
 XttBLwa/57LRNbfPIZ1CK4men4TUDqB2ZAhseAXvZ8pVkkVDJsXCOTQuFYin5jg4eUL6
 ZrSA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1DGjbkl0p+KD/LthiqXOfDDC1aLjigIIJtY+l8PrjjJQk4Xnm2HtGg+Bse3yxPmPO6+/R9duTdKJT@nongnu.org
X-Gm-Message-State: AOJu0YxmsbU8Rjzq+dGVGJVIztcQTF+Lx/PA+iNvCxBeQKiWcbAtDPGf
 A02Cirtzyd8826MeLSmevGox2C6vIqKM2FNDh5SrIT5IfG8lTC8Y9fuzKqXdr94javH6Y1TWxgS
 5dt3OIzU8+AnA7FV+nPclDB53khqpi0m6iDci7bJ/3GoVNbbE1xCbv+n/7w==
X-Gm-Gg: AfdE7cmHBXZAHJWSgQNKcxLR6hC2/dn5hiswxRlZzUSNoA7Igw2Rh0vSjS8L5y7JhJl
 HDZfMDLuNfoQ4v+3rTAkPOzETUAG9I0TsAlB/zraT5LaGIAk8aZL/waGVeL3DCf+1Yz6Yu48DMl
 e1i8UNL0f00jwqX3Xu3lQhb4Elt7sT/o8qC1ARneQ4leR4fqpIzrZNNPnDSK6kTNBFlLYvxJzyK
 LrgV6zxLwV1mKp9G5vlrQSb4XE7MrYUJUOwKAp7gvPwR8HgFlvJjEPRQrZ0c6pFmiq0NrkJ3jHf
 C5eVEGwxgpPg4exJ2gxNidi1kgCey4tVrXpjmyqrqh4aD2WOsIVnISYL7pMN11CXmGfpH+1Jbun
 oMrALzlBmnxJMNu19GYVR/hOuKXWCNgMOtMGIhuW2URiD+AIJ621bS9yg8isJ+D9fPkuCo3C2bb
 IalL4=
X-Received: by 2002:a05:6a21:6b12:b0:3b4:6f7e:d0f4 with SMTP id
 adf61e73a8af0-3c1109e29c6mr9694452637.15.1783958384075; 
 Mon, 13 Jul 2026 08:59:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b12:b0:3b4:6f7e:d0f4 with SMTP id
 adf61e73a8af0-3c1109e29c6mr9694423637.15.1783958383599; 
 Mon, 13 Jul 2026 08:59:43 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f7293sm69276381eec.3.2026.07.13.08.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 08:59:43 -0700 (PDT)
Message-ID: <ae18fa27-a1c7-42d1-864e-5a9a30c1215f@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 08:59:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] uftrace: riscv privilege level
To: Yanfeng Liu <yfliu2008@qq.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, erdnaxe@crans.org
References: <tencent_E17E8F6494EE130F71527C6BCE481AF33E08@qq.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tencent_E17E8F6494EE130F71527C6BCE481AF33E08@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2NiBTYWx0ZWRfXxs0r90Jl7clz
 AW0s6uWbIX4aCq+JPUTZzEwqhpyZjcTlVxZcXjUXmlJJUjfL1BScFfUEN8E3C13TnYY7XbZ9Al1
 NjiLECaBINfU3p4tKimp4C58A855SoI=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a550b71 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=dZbOZ2KzAAAA:8 a=2EAK0dWcFSsNEvSIV9MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ht-svVH66YpWWxguiUDJdAXeZoT05r2P
X-Proofpoint-ORIG-GUID: ht-svVH66YpWWxguiUDJdAXeZoT05r2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2NiBTYWx0ZWRfX/DzlBqJ60/M+
 QRQTNQxKkTNkl6SBOLOWV+4XX9L3VuUqYtWe1IUjkOeDFcKLTzXiTbHJxUIjn0TU95RuVXdVGCc
 6Co8VK9E3anYpy9T90yAc6SZYG4vERDF809RouuuYc8JJkUaUzeKgUlINtCwh/KsnmNDVMlsd7e
 KFcUbIiNv3UNq9bjzxoe8dy9yj+xT7DgilU+8bZ9eAUuG3qJpCOvL5AHWn7vaKKewA10D4ZSHF9
 ELL0Qrr9OQbZq20kWHZX3A+GRXFxoZXgnPuBWfKuWj2iZIuve0skyV8X3LYlUvuYwPCHuSCDof9
 GciEcNK7H/Ov4hOgnpWo31eiXTC5Jm3b56ITH0F0w9HpD+ZaymLvXfxoOMh1USBxbrk4nB7UVso
 XTH56DpgZsMWuzLH1VFly1egcI/n5rcMLXx0fbUuqILOUH4C8L6DERFYjiiBi2mYk3yG2cHP9jO
 nPt7V5+W1s7KL3mIYGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130166
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

Hi,

On 7/12/2026 1:45 AM, Yanfeng Liu wrote:
> This adds RiscV virtual user and supervisor privilege levels to
> uftrace plugin to avoid crashing with H extension guests.
> 
> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
> ---
>  contrib/plugins/uftrace.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/contrib/plugins/uftrace.c b/contrib/plugins/uftrace.c
> index 9b0a4963ae..063e32220b 100644
> --- a/contrib/plugins/uftrace.c
> +++ b/contrib/plugins/uftrace.c
> @@ -109,6 +109,8 @@ typedef enum {
>      RISCV64_SUPERVISOR,
>      RISCV64_RESERVED,
>      RISCV64_MACHINE,
> +    RISCV64_VUSER,
> +    RISCV64_VSUPERVISOR,
>      RISCV64_PRIVILEGE_LEVEL_MAX,
>  } Riscv64PrivilegeLevel;
>  
> @@ -153,8 +155,10 @@ static void uftrace_write_map(bool system_emulation)
>      const char *path = "./uftrace.data/sid-0.map";
>  
>      if (system_emulation && access(path, F_OK) == 0) {
> -        /* do not erase existing map in system emulation, as a custom one might
> -         * already have been generated by uftrace_symbols.py */
> +        /*
> +         * do not erase existing map in system emulation, as a custom one might
> +         * already have been generated by uftrace_symbols.py
> +         */
>          return;
>      }
>  
> @@ -706,6 +710,8 @@ static const char *riscv64_get_privilege_level_name(uint8_t pl)
>      case RISCV64_SUPERVISOR: return "Supervisor";
>      case RISCV64_RESERVED: return "Unknown";
>      case RISCV64_MACHINE: return "Machine";
> +    case RISCV64_VUSER: return "VUser";
> +    case RISCV64_VSUPERVISOR: return "VSupervisor";
>      default:
>          g_assert_not_reached();
>      }
> @@ -986,7 +992,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>  
>      score = qemu_plugin_scoreboard_new(sizeof(Cpu));
>      qemu_plugin_register_vcpu_init_cb(id, vcpu_init, NULL);
> -    qemu_plugin_register_atexit_cb(id, at_exit, (void *) info->system_emulation);
> +    qemu_plugin_register_atexit_cb(id, at_exit,
> +                                   (void *) info->system_emulation);
>      qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans, NULL);
>  
>      return 0;


Is that something we have implemented in upstream QEMU for riscv64
target? From what I can see, priv register only can have M,S,U values.

Regards,
Pierrick

