Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B22CDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 13:37:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbeqD-0006LJ-9m; Mon, 22 Jun 2026 09:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbeqC-0006L2-06
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 09:37:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbeq9-00011n-Nz
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 09:37:31 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MDGIKB1261213
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 13:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 smLlyY+l1Z8hx+EdfmaE/m1mmOrOgZDFeK6L+wOl1k4=; b=BajqLT546YWCgCBi
 ZEg0Wy1wW5cA18LDJfot9eQUkwhcaag3q7Mg/azx+PORbDSTmHcLyzIwoBdg7KRW
 yRxxFeBkqZPbtfgkotaMeyqITL1wydjhkF1vuSr5M1FiFYNvbLkneJSR0Tww8Brt
 ANUXsNuBLOrk30oRXUceHQe2RArCP6KeLZzvqxGJVtQBfT1SEzD4ydU34NQ5rHL3
 i6OfNz685jplWNsq74tH/AJ7CkmCShtmqeTeK4bF5Ua2zerDXpgO7AQbaG1tA2/O
 tYvkqrn7a8Em+4nSGT2OxAWipTi4roh+vXXQp3ohzmlbBh1xD4AfOkkNG3BROtns
 kKBffA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8kc0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 13:37:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-963b07e2003so5475279241.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782135447; x=1782740247; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=smLlyY+l1Z8hx+EdfmaE/m1mmOrOgZDFeK6L+wOl1k4=;
 b=Vbh0xcDxVBAVopCapSfx1n7eYBX3k3NReAcQnkbRRM4Gkpy28roeYACo7TEW8FtR8f
 n+G40WINC0S6graVu6DDQ/aqhpk/mQ2diwDolw0TZm2y7X6R/D2xNhT4/tkuX6E9gpIt
 uWTQATY4DwZMWqEQkjOx60KKWvhoQU4/7tnouGvkIZLwSmFVxyHAHRDHZ3QRpHhw2pzd
 jnFRYNQet+F8O3sXKI79s+v2dtg3G3+TWAZ4zcSrLbqL+JC2TWiqwKJ9mIYJFHdYlF8K
 MtGmWAzz2pZHzqto47bNZz4pzebk7EPvZ8oTK8cz0htdVdnQf0TNAtKj5EKpkuz9T+W1
 z3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782135447; x=1782740247;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=smLlyY+l1Z8hx+EdfmaE/m1mmOrOgZDFeK6L+wOl1k4=;
 b=Ej0vyGyTz8EdCThNVg3hITgiyO3fe+6u/B2EWRMOeF4rzOOjGHYwzkbno030u7Ls45
 //MDUmTt1iavbDtQ5Je+Gxfan9IeWnDodrYxuLxiDEN0kX2JBnySuw1HQaESjApsI6Yo
 zaW2ZIy3EuJ/4Zv7H7exmd3l4TTnG+pn4OrKTl0MBgLUbZFPMx6c6XcDkqgC7Tt86L0X
 b4fapFwUfx3y+JHTKpeO2p+SGeF/uTDlTKSPa391FVPUhTz4MFy2mLa+xzqzAWUzOeJx
 xkd7wpU1XyMXb+3cPzsaWNUpry9AK8nW++D0LJOGrmL+y34BlbZFnsnepDjNbI9nAXhN
 vxCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8XDYIxHIBNhuES9JnTlN2n/nLp495fsZsbioL0F/evEIRFiyo5wMuRj3kiOWsMxD5HFQSV6DlxWsZp@nongnu.org
X-Gm-Message-State: AOJu0YyUocF8UySIYOm+JvJGL3slAbZEZSBW7j1Q9DPh7yKh7SWpRan8
 Hh1M/XaxvRy/SRx0EC5UpUpR4YRbWwRqW2XYnFgzjRowEMRRKMz2o8gSlDmJvMnShihMMITWdLk
 /7gEnVxTn1BkR3XeYc5Croa32HwJuq3t/8R2KJ9TAe+0AwBIqqzaP0QPZaA==
X-Gm-Gg: AfdE7clr1Yt8D5r6G1CLxFRmZAjQDtJpfg+OpXWr1IoPJb1HgesQzkSpx8fXYXoMH2W
 ogQFEtgzJPtGr8DmGyYrA/x2kpADVA7sO4hYI1JwvSSc9qbONHMEpjWjvUowSwrHkfBRNweMAPK
 Yxcf3AqAyqsc51Ls+tSPTtpCrFtXrBM+cKqB+VwFnc8gW5TSKHJxj6JsStW6ZS6FkUptqyzzfR0
 zp4+ckVFTeaQZbVxB8D21VuuX9IU0vYs+rykmShnYUm3tMIumCI20nEPzRKvK0lKbOdZh5+PFrN
 AfmP/Z9R/bHj2MPSeRPv1tFf9l88N6vmSb7AtJqFkUODExJtZzzQP57FzWKcnD2qRmwl5Wajfoi
 uz+OJofst2Dm5QVS7/JqCLUKiPUc0O8WzpNfqE53z5srk3mVS4gQWLFLeVmAjxQ==
X-Received: by 2002:a05:6102:4415:b0:726:cd42:d039 with SMTP id
 ada2fe7eead31-72a03fb3994mr8603775137.24.1782135446968; 
 Mon, 22 Jun 2026 06:37:26 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:726:cd42:d039 with SMTP id
 ada2fe7eead31-72a03fb3994mr8603738137.24.1782135446503; 
 Mon, 22 Jun 2026 06:37:26 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c0c61610bacsm373321466b.58.2026.06.22.06.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 06:37:25 -0700 (PDT)
Message-ID: <b8bcfe91-b1c4-4337-ad5f-70c56bfcae89@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: raise access fault for Zicbom MMIO-like
 accesses
Content-Language: en-US
To: GavinQin <qinzhengxiang@foxmail.com>
References: <tencent_4EF8937D817B836D3D911B9B05491B02950A@qq.com>
 <f174b13c-2678-42d8-b59b-b14d7e9177cd@oss.qualcomm.com>
 <tencent_F954C3899244322DF03FB0DD2714E3BBA007@qq.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>
In-Reply-To: <tencent_F954C3899244322DF03FB0DD2714E3BBA007@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfXwOwMFta0a32S
 8BhD/XyPCW0P5hp5hSon1/UR+dMfEmUG2VyN6FY/i3RbBIoBiWGjSrlcSWtG7BegB41Rf3QWGbf
 DkB81IOlvDVfYe5xmZVJOeK0DnY9IQo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX1dvdZDnlm8AL
 bqg0zHxYYzVM5FIfEg/li2+R4go550EvPZWBHTcPH8Ud9OCO0mWK6wdmt+B+KBLAdzJfotzXiwO
 Sne1L+flBXUy/eTRVsSwCz9kkky3/EDBg6M1FmgvOvz13GwEbV1dN8JLn79ZuhMmqcDBfhPhBRK
 8Wa94O+YydqjZBnJFnyUMbbmo4ZFjquZARbcy2cyjiaN6VhAeo2Dd4KcOcLB7IchyNaokgZLplk
 QRuKvE4gKNz+PHRm8qW5mVJXF0GpMXcDh3rqvzVX78teHbb1UiMiAKUDyvyU6qqUbFXSjV0L/Tw
 Q8pKvJjLq29Zejx7aVYv8QZLIfnG1wy/yBz7iMSLPDYEIXh4bun67Bpg4H0tyqbu1nVAQ1FiQng
 mdIHJpoZc5zQrR/wacDGo0ActZNvkvRZ9NfcyxmmVhn9375UN7tmUInYKV/Ano5GGEdOJhI6+Q0
 +20sZhQY4M1oFHu/leg==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a393a97 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8 a=69wJf7TsAAAA:8
 a=pGLkceISAAAA:8 a=_O3DOGVWAAAA:8 a=JF9118EUAAAA:8 a=SRrdq9N9AAAA:8
 a=9U8TD8S4ao6_Lu7WPhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=J2PsDwZO0S0EpbpLmD-j:22 a=Fg1AiH1G6rFz08G2ETeA:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: YMlWlMjxccHzFwkSvkyeTrKzqzoqUm52
X-Proofpoint-ORIG-GUID: YMlWlMjxccHzFwkSvkyeTrKzqzoqUm52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220134
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

On 21/6/26 14:47, GavinQin wrote:
> Thanks Philippe.
> 
> In my tree CPURISCVState::badaddr is target_ulong,

But this list is for public mainstream QEMU... Where your patch
is going to land, and many developers are going to use it...

This field is uint64_t since this commit:

   commit f2287c7020f36e2f13622d9635a968d6f6fb507d
   Author: Anton Johansson <anjo@rev.ng>
   Date:   Wed May 20 14:53:43 2026 +0200

       target/riscv: Fix size of badaddr and bins

You should base your patches on the latest QEMU /master branch.

> so I'll keep fault_addr as
> target_ulong to match it. I'll add the else for readability in v3 and keep your
> Reviewed-by tag.
> 
> Thanks,
> ZhengXiang
> 
> 
> 
> 
> GavinQin
> qinzhengxiang@foxmail.com
> 
> 
> 
>          
> 
> 
> 
>           原始邮件
>           
>         
> 发件人：Philippe Mathieu-Daudé <philmd@oss.qualcomm.com&gt;
> 发件时间：2026年6月18日 22:36
> 收件人：ZhengXiang Qin <qinzhengxiang@foxmail.com&gt;, qemu-devel <qemu-devel@nongnu.org&gt;
> 抄送：qemu-riscv <qemu-riscv@nongnu.org&gt;, Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com&gt;, Chao Liu <chao.liu.zevorn@gmail.com&gt;, Palmer Dabbelt <palmer@dabbelt.com&gt;, Alistair Francis <alistair.francis@wdc.com&gt;, Weiwei Li <liwei1518@gmail.com&gt;, Liu Zhiwei <zhiwei_liu@linux.alibaba.com&gt;
> 主题：Re: [PATCH v2] target/riscv: raise access fault for Zicbom MMIO-like accesses
> 
> 
> 
>         On&nbsp;18/6/26&nbsp;16:06,&nbsp;ZhengXiang&nbsp;Qin&nbsp;wrote:
> &gt;&nbsp;check_zicbom_access()&nbsp;currently&nbsp;treats&nbsp;any&nbsp;probe_access_flags()&nbsp;result
> &gt;&nbsp;other&nbsp;than&nbsp;TLB_INVALID_MASK&nbsp;as&nbsp;a&nbsp;successful&nbsp;access.&nbsp;However,&nbsp;a&nbsp;result
> &gt;&nbsp;with&nbsp;TLB_MMIO&nbsp;means&nbsp;that&nbsp;the&nbsp;target&nbsp;is&nbsp;MMIO-like&nbsp;and&nbsp;should&nbsp;not&nbsp;be
> &gt;&nbsp;treated&nbsp;as&nbsp;a&nbsp;normal&nbsp;cache&nbsp;block&nbsp;management&nbsp;target.
> &gt;&nbsp;
> &gt;&nbsp;Raise&nbsp;a&nbsp;store/AMO&nbsp;access&nbsp;fault&nbsp;for&nbsp;Zicbom&nbsp;accesses&nbsp;to&nbsp;MMIO-like&nbsp;regions
> &gt;&nbsp;so&nbsp;that&nbsp;cbo.clean,&nbsp;cbo.flush&nbsp;and&nbsp;cbo.inval&nbsp;do&nbsp;not&nbsp;silently&nbsp;succeed&nbsp;on
> &gt;&nbsp;non-cacheable/MMIO-like&nbsp;memory.
> &gt;&nbsp;
> &gt;&nbsp;Resolves:&nbsp;https://gitlab.com/qemu-project/qemu/-/issues/3501
> &gt;&nbsp;Reviewed-by:&nbsp;Daniel&nbsp;Henrique&nbsp;Barboza&nbsp;<daniel.barboza@oss.qualcomm.com&gt;
> &gt;&nbsp;Reviewed-by:&nbsp;Chao&nbsp;Liu&nbsp;<chao.liu.zevorn@gmail.com&gt;
> &gt;&nbsp;Signed-off-by:&nbsp;ZhengXiang&nbsp;Qin&nbsp;<qinzhengxiang@foxmail.com&gt;
> &gt;&nbsp;---
> &gt;&nbsp;Changes&nbsp;since&nbsp;v1:
> &gt;&nbsp;-&nbsp;Use&nbsp;a&nbsp;bit&nbsp;test&nbsp;for&nbsp;TLB_MMIO&nbsp;since&nbsp;probe_access_flags()&nbsp;returns&nbsp;a&nbsp;bitmask.
> &gt;&nbsp;-&nbsp;Keep&nbsp;Reviewed-by&nbsp;tags&nbsp;from&nbsp;v1.
> &gt;&nbsp;
> &gt;&nbsp;&nbsp;&nbsp;target/riscv/op_helper.c&nbsp;|&nbsp;5&nbsp;+++++
> &gt;&nbsp;&nbsp;&nbsp;1&nbsp;file&nbsp;changed,&nbsp;5&nbsp;insertions(+)
> &gt;&nbsp;
> &gt;&nbsp;diff&nbsp;--git&nbsp;a/target/riscv/op_helper.c&nbsp;b/target/riscv/op_helper.c
> &gt;&nbsp;index&nbsp;81873014cb..f23b060585&nbsp;100644
> &gt;&nbsp;---&nbsp;a/target/riscv/op_helper.c
> &gt;&nbsp;+++&nbsp;b/target/riscv/op_helper.c
> &gt;&nbsp;@@&nbsp;-218,6&nbsp;+218,7&nbsp;@@&nbsp;static&nbsp;void&nbsp;check_zicbom_access(CPURISCVState&nbsp;*env,
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;void&nbsp;*phost;
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;ret;
> &gt;&nbsp;&nbsp;&nbsp;
> &gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;target_ulong&nbsp;fault_addr&nbsp;=&nbsp;address;
> 
> CPURISCVState::badaddr&nbsp;is&nbsp;of&nbsp;type&nbsp;uint64_t,&nbsp;can&nbsp;we&nbsp;use&nbsp;that&nbsp;here&nbsp;instead
> of&nbsp;target_ulong?
> 
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;Mask&nbsp;off&nbsp;low-bits&nbsp;to&nbsp;align-down&nbsp;to&nbsp;the&nbsp;cache-block.&nbsp;*/
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;address&nbsp;&amp;=&nbsp;~(cbomlen&nbsp;-&nbsp;1);
> &gt;&nbsp;&nbsp;&nbsp;
> &gt;&nbsp;@@&nbsp;-235,6&nbsp;+236,10&nbsp;@@&nbsp;static&nbsp;void&nbsp;check_zicbom_access(CPURISCVState&nbsp;*env,
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret&nbsp;=&nbsp;probe_access_flags(env,&nbsp;address,&nbsp;cbomlen,&nbsp;MMU_DATA_LOAD,
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmu_idx,&nbsp;true,&nbsp;&amp;phost,&nbsp;ra);
> &gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(ret&nbsp;&amp;&nbsp;TLB_MMIO)&nbsp;{
> &gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;env-&gt;badaddr&nbsp;=&nbsp;fault_addr;
> &gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;riscv_raise_exception(env,&nbsp;RISCV_EXCP_STORE_AMO_ACCESS_FAULT,&nbsp;ra);
> &gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;}
> 
> Maybe&nbsp;adding&nbsp;'else'&nbsp;make&nbsp;this&nbsp;code&nbsp;path&nbsp;more&nbsp;readable.
> 
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(ret&nbsp;!=&nbsp;TLB_INVALID_MASK)&nbsp;{
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;Success:&nbsp;readable&nbsp;*/
> &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;
> 
> Feel&nbsp;free&nbsp;to&nbsp;ignore&nbsp;these&nbsp;nitpicking&nbsp;comments.
> 
> Reviewed-by:&nbsp;Philippe&nbsp;Mathieu-Daudé&nbsp;<philmd@oss.qualcomm.com&gt;


