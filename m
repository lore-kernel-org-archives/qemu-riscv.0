Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6D5C2A09B
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:42:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsNe1-0003oB-G2; Fri, 07 Aug 2026 12:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsNdz-0003nb-Hi
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 12:42:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsNdw-0003x0-LZ
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 12:42:03 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677GbdFa1538211
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 16:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pvKF/y2Jnf2AmP/FN/zaOfIDu4EtjAxeyQ6mj9ejGeM=; b=mDavfL4zSKAwDjDK
 HTCoCktUYHuop7gHlyL0SaC+i+ZSAwbSHPvoHoKIsh+oZbUIjmeZg7bxNSIFrRE4
 8v2Vy0zRM7UIoqu+HcAbyxtR3gQVJdxNCJJRWMSrydq/r+yEs12xRErS85Wi4z2y
 H6TOvjSr68BBl2Ey2FuNCUYICUkSwThWIaVMY0iVdHyaYLxAmyf4SbFHJ28swNkf
 QlsoMkNR0tio7SsZce2e5B9eCflf4A01/oQGPIerrn0/9M83948MxavTVTbH/5pw
 vPrE9JU8djS+4OPTIVgl/TvesgM28uW/RptR/znC0dxIBWO0MelQyuNSTRSQuTbs
 1TCj7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwk2000j9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 16:41:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93494174477so301774185a.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786120919; x=1786725719; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pvKF/y2Jnf2AmP/FN/zaOfIDu4EtjAxeyQ6mj9ejGeM=;
 b=Co8KsJvmzDPDhpAJ6pbH2DUhVYO0X3Gw0S/4Q8XKWOQysgVtWnjX3pScNB2fgdoBF8
 IwPkvlI97B8KSl1LlJn/R0DofXvrskm36MH6yu7mR5C+hi1C0mK+vOnrQuLXrKCXEbXK
 u5cRjihJGLS3BzCbLi3TBUhF/lTgvx8StOnHDomJPT9r8N9/GZrD6w3W9XhCuIlg3k6U
 icJZvJhJMpqSZKeBy9bT0DnwpY+vg3/vNh25tWjeHSwqBSunk6RAScK4FE0sVlqOCktU
 K0kDS3ue6crouDN8jmuPbG5x4abH1i1JMP3uK0QSB89x9wPrtewlkdntNKif2YTNeUHn
 BrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786120919; x=1786725719;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pvKF/y2Jnf2AmP/FN/zaOfIDu4EtjAxeyQ6mj9ejGeM=;
 b=jkWEN6OyDYfpaqvZmE92yyRgxtJoW/95eJTNMlQ/iZQgq0D08+Z7r15jX8EAu8Lwtp
 Mkdt7gQCcf5d0AgqH9LeqZR4pXJPER4rjGwPjL9F2gLdw6P2JF0AV8yAxqisVnm+i3dX
 i1y8tza6oPQDIzHWq12IwoyhDL5oEtJGrsI1E3BGbzcD+YJDzV8WvoorZa01wUBg7KcC
 AdQLOBFq1K2L/ckLwOcFCuueaXSqnxMSCCGtPGv1V4eI1VEOZaNWojp4Nm38lTSFc4NJ
 xiWTEHkDyLUP4TNFZksmORgV3186FHuuuu51HJIn2KUO8TRAJrLf0fTc1eYkK6AcKEop
 XWng==
X-Forwarded-Encrypted: i=1;
 AHgh+RqT0tsK8LLTVkSrtaBb0iSxaR9fgGEo55GORuY0q8uHsiKRz+DxumRpHNwGkGRyLC0vZLioKLA8GWqb@nongnu.org
X-Gm-Message-State: AOJu0YyrC0PbCKlf4pIzITAA3oAs6AllGLmCUTUAaMRY5Buqzgr7Cnub
 QkQsXC8uXzMq4npzhAhMZ3jiXBeq5brbbUGhUD0A0sJbe6geYkyfJnm2LssV7nxcQ/cYye8DyJc
 Jg1PBCdr75LLEgdn7sBjTRItQMeZEL653/O1Stu2RpIl0dzHTw0cMKZcVTA==
X-Gm-Gg: AR+sD10MNLS+WPGMTTZciOdQvjQ6ZVkJVO02wZ0Q2alI80E1wfSvEC9ODj7F2VUk2iQ
 jlVtjnCZzD6F0cObo0yGXV7DVDERb9JkhJiBtkLYvNQY2y7Fj7LxWFFWzgTRyq1zZ7HJ+DnFdyp
 C7c4yUa+qm2amLdifROkTpbfgdkts+wzT9uZDDwCh7RQn89TGMX/2iNr9pvasdrp85Yvyk1EL1W
 UycJj2xj1cVCTI65HIdWvHiONz0/m4mp5qau/vXe6b0ByoPURf9SscYsyggWrYB845Rl6an00ms
 kN+lrzKPW5R3+6o1a7ANGv91sZ96tMWKJFSejHlu1FZYvna6W5DdBAxmKDiNWR0sbiLLXe+fmlh
 wF8NvZjh1I/9ZAvnz1sZ9Ga2gaK15HVVCmO9D
X-Received: by 2002:a05:620a:4389:b0:933:966:4fc9 with SMTP id
 af79cd13be357-9367984e250mr180939185a.27.1786120918980; 
 Fri, 07 Aug 2026 09:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4389:b0:933:966:4fc9 with SMTP id
 af79cd13be357-9367984e250mr180930185a.27.1786120918362; 
 Fri, 07 Aug 2026 09:41:58 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9366e290054sm189759285a.40.2026.08.07.09.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 09:41:57 -0700 (PDT)
Message-ID: <d5f88455-7ed6-4f89-aead-73910080acf2@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 13:41:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] tests/qtest: test K230 I2C transfers with slave
 devices
To: Wang Zhongyu <wzy15515798875@gmail.com>,
 Chao Liu <chao.liu@processmission.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20260807152830.6833-1-wzy15515798875@gmail.com>
 <20260807152830.6833-6-wzy15515798875@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260807152830.6833-6-wzy15515798875@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEzMCBTYWx0ZWRfX+hNvIwukYWgP
 sTXN1JWbmnrJy/t4esKOWO034HKTfyb4m4kIpuO6Cf3gSxW3MV25ZrvNDJmCZpeZ3GXxTQI+XVy
 6wSa00/VJezsyVwGwpGXI76nrsbnNkKA/DTLSrkjJBidFs0/NJQ//VlWPsWopu6Lg/JVwOXVPKx
 u0tdTpAvdLnkUgKmAPSqjgFQl9g+JzYJcPYGJGEw58r9ISKlUav8JCYRIb3oa4JZUHTlE7Doy9Z
 NXvHrCxT2UDkChoewWlm/QyMwPQbfBdPIrxMwLQ1IrGDOYfarM7aQh4MNN7czIAZUcbVKmkqwbF
 j0qUgNP7JLihw4QGIJIczv+WkflXbgdRaV9oGyh3ks7xoigD6gjBxX6RcJSTjLMbi1GIHiE5OZ/
 8n8MSBRzSb69nO3fDRkz6SLsQTOAg/a25uKvN94mYgl7J2VPIVwY313kFg7yxq+dCMtabsH6Ba9
 yl/UYOORt4OBWJeUOtw==
X-Proofpoint-ORIG-GUID: viRT2ehHe08apdy0t53FZq4Mq_iXi16S
X-Proofpoint-GUID: viRT2ehHe08apdy0t53FZq4Mq_iXi16S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEzMCBTYWx0ZWRfX3Oc38Swq9n8P
 OYILRvkaLebRVPk0Fr+5FF8pIxBSPqsPEY/BPR5ZmUmt5Sx57QTNXu/nu9uYxHfqvPL53tLazBj
 yqhB/lSb8afo1X7oycXbJS86lcmpPhU=
X-Authority-Analysis: v=2.4 cv=Fvw1OWrq c=1 sm=1 tr=0 ts=6a760ad7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=T173MrlpoI-LIAnwAeMA:9
 a=YACZawio-G6MUeFX:21 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070130
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



On 8/7/2026 12:28 PM, Wang Zhongyu wrote:
> Add transfer tests using TMP105 and i2c-echo slave devices.
> 
> Cover single- and multi-byte reads and writes, combined write/read
> transfers, repeated START and STOP handling, RX threshold and
> overflow behavior, data NACK reporting, restart-disabled aborts.
> 
> Signed-off-by: Wang Zhongyu <wzy15515798875@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   tests/qtest/k230-i2c-test.c | 598 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 598 insertions(+)
> 
> diff --git a/tests/qtest/k230-i2c-test.c b/tests/qtest/k230-i2c-test.c
> index 1d134de5d0..ee788216fb 100644
> --- a/tests/qtest/k230-i2c-test.c
> +++ b/tests/qtest/k230-i2c-test.c
> @@ -38,7 +38,11 @@
>   #define K230_IC_TX_TL                  0x3c
>   #define K230_IC_CLR_INTR               0x40
>   #define K230_IC_CLR_RX_UNDER           0x44
> +#define K230_IC_CLR_RX_OVER            0x48
>   #define K230_IC_CLR_TX_ABRT            0x54
> +#define K230_IC_CLR_ACTIVITY           0x5c
> +#define K230_IC_CLR_STOP_DET           0x60
> +#define K230_IC_CLR_START_DET          0x64
>   #define K230_IC_ENABLE                 0x6c
>   #define K230_IC_STATUS                 0x70
>   #define K230_IC_TXFLR                  0x74
> @@ -63,20 +67,29 @@
>   /* IC_DATA_CMD */
>   #define IC_DATA_CMD_READ               BIT(8)
>   #define IC_DATA_CMD_STOP               BIT(9)
> +#define IC_DATA_CMD_RESTART            BIT(10)
>   
>   /* IC_INTR_STAT and IC_RAW_INTR_STAT */
>   #define IC_INTR_RX_UNDER               BIT(0)
> +#define IC_INTR_RX_OVER                BIT(1)
> +#define IC_INTR_RX_FULL                BIT(2)
>   #define IC_INTR_TX_EMPTY               BIT(4)
>   #define IC_INTR_TX_ABRT                BIT(6)
>   #define IC_INTR_ACTIVITY               BIT(8)
> +#define IC_INTR_STOP_DET               BIT(9)
>   #define IC_INTR_START_DET              BIT(10)
>   
>   /* IC_STATUS */
> +#define IC_STATUS_ACTIVITY             BIT(0)
>   #define IC_STATUS_TFNF                 BIT(1)
>   #define IC_STATUS_TFE                  BIT(2)
> +#define IC_STATUS_RFNE                 BIT(3)
> +#define IC_STATUS_RFF                  BIT(4)
> +#define IC_STATUS_MST_ACTIVITY         BIT(5)
>   
>   /* IC_TX_ABRT_SOURCE */
>   #define IC_ABRT_7B_ADDR_NOACK          BIT(0)
> +#define IC_ABRT_TXDATA_NOACK           BIT(3)
>   #define IC_ABRT_GCALL_NOACK            BIT(4)
>   #define IC_ABRT_GCALL_READ             BIT(5)
>   #define IC_ABRT_SBYTE_NORSTRT          BIT(9)
> @@ -86,6 +99,19 @@
>   #define K230_IC_COMP_VERSION_VALUE     0x3132302a
>   #define K230_IC_COMP_TYPE_VALUE        0x44570140
>   
> +#define TMP105_ADDRESS                  0x49
> +#define I2C_ECHO_ADDRESS                0x50
> +
> +#define TMP105_REG_TEMPERATURE          0x00
> +#define TMP105_REG_CONFIG               0x01
> +#define TMP105_REG_T_LOW                0x02
> +#define TMP105_REG_T_HIGH               0x03
> +
> +#define K230_I2C_SLAVE_MACHINE_ARGS                             \
> +    "-machine k230 "                                            \
> +    "-device tmp105,id=tmp105-test,address=0x49 "                \
> +    "-device i2c-echo,id=i2c-echo-test,address=0x50"
> +
>   static const uint64_t k230_i2c_base[K230_I2C_COUNT] = {
>       K230_I2C0_BASE,
>       K230_I2C1_BASE,
> @@ -94,6 +120,129 @@ static const uint64_t k230_i2c_base[K230_I2C_COUNT] = {
>       K230_I2C4_BASE,
>   };
>   
> +static QTestState *k230_i2c_init_with_slaves(void)
> +{
> +    return qtest_init(K230_I2C_SLAVE_MACHINE_ARGS);
> +}
> +
> +static void k230_i2c_configure_master(QTestState *qts, uint64_t base,
> +                                      uint8_t target, bool restart_enable)
> +{
> +    uint32_t con;
> +
> +    qtest_writel(qts, base + K230_IC_ENABLE, 0);
> +
> +    con = qtest_readl(qts, base + K230_IC_CON);
> +    con |= IC_CON_MASTER_MODE;
> +    con &= ~IC_CON_10BITADDR_MASTER;
> +
> +    if (restart_enable) {
> +        con |= IC_CON_RESTART_EN;
> +    } else {
> +        con &= ~IC_CON_RESTART_EN;
> +    }
> +
> +    qtest_writel(qts, base + K230_IC_CON, con);
> +    qtest_writel(qts, base + K230_IC_TAR, target);
> +    qtest_writel(qts, base + K230_IC_ENABLE, 1);
> +}
> +
> +static void k230_i2c_assert_no_abort(QTestState *qts, uint64_t base)
> +{
> +    uint32_t raw;
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +
> +    g_assert_cmphex(raw & IC_INTR_TX_ABRT, ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_TX_ABRT_SOURCE),
> +                    ==, 0);
> +}
> +
> +static uint64_t k230_i2c_find_tmp105_bus(QTestState *qts)
> +{
> +    for (int i = 0; i < K230_I2C_COUNT; i++) {
> +        uint64_t base = k230_i2c_base[i];
> +        uint32_t raw;
> +
> +        k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +
> +        /*
> +         * A one-byte write selects the temperature register.  The
> +         * controller whose bus contains TMP105 completes without aborting.
> +         */
> +        qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                     IC_DATA_CMD_STOP | TMP105_REG_TEMPERATURE);
> +
> +        raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +
> +        if (!(raw & IC_INTR_TX_ABRT)) {
> +            qtest_writel(qts, base + K230_IC_ENABLE, 0);
> +            return base;
> +        }
> +
> +        qtest_readl(qts, base + K230_IC_CLR_TX_ABRT);
> +        qtest_writel(qts, base + K230_IC_ENABLE, 0);
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +static void k230_i2c_write_bytes(QTestState *qts, uint64_t base,
> +                                 const uint8_t *data, size_t len)
> +{
> +    g_assert_cmpuint(len, >, 0);
> +
> +    for (size_t i = 0; i < len; i++) {
> +        uint32_t command = data[i];
> +
> +        if (i == len - 1) {
> +            command |= IC_DATA_CMD_STOP;
> +        }
> +
> +        qtest_writel(qts, base + K230_IC_DATA_CMD, command);
> +    }
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +}
> +
> +static void k230_i2c_select_register(QTestState *qts, uint64_t base,
> +                                     uint8_t reg)
> +{
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 IC_DATA_CMD_STOP | reg);
> +    k230_i2c_assert_no_abort(qts, base);
> +}
> +
> +static void k230_i2c_queue_reads(QTestState *qts, uint64_t base,
> +                                 size_t len, bool restart_first,
> +                                 bool stop_last)
> +{
> +    g_assert_cmpuint(len, >, 0);
> +
> +    for (size_t i = 0; i < len; i++) {
> +        uint32_t command = IC_DATA_CMD_READ;
> +
> +        if (i == 0 && restart_first) {
> +            command |= IC_DATA_CMD_RESTART;
> +        }
> +
> +        if (i == len - 1 && stop_last) {
> +            command |= IC_DATA_CMD_STOP;
> +        }
> +
> +        qtest_writel(qts, base + K230_IC_DATA_CMD, command);
> +    }
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +}
> +
> +static void k230_i2c_tmp105_combined_read(QTestState *qts, uint64_t base,
> +                                          uint8_t reg, size_t len)
> +{
> +    qtest_writel(qts, base + K230_IC_DATA_CMD, reg);
> +    k230_i2c_queue_reads(qts, base, len, true, true);
> +}
> +
>   static void test_reset_values(void)
>   {
>       QTestState *qts = qtest_init("-machine k230");
> @@ -824,6 +973,432 @@ static void test_start_byte_abort(void)
>       qtest_quit(qts);
>   }
>   
> +static void test_tmp105_config_read_write(void)
> +{
> +    static const uint8_t write_data[] = {
> +        TMP105_REG_CONFIG,
> +        0x60,
> +    };
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +
> +    k230_i2c_write_bytes(qts, base, write_data,
> +                         G_N_ELEMENTS(write_data));
> +
> +    k230_i2c_tmp105_combined_read(qts, base,
> +                                  TMP105_REG_CONFIG, 1);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 1);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x60);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 0);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +    qtest_quit(qts);
> +}
> +
> +static void test_tmp105_limit_read_write(void)
> +{
> +    static const uint8_t write_data[] = {
> +        TMP105_REG_T_LOW,
> +        0x12,
> +        0x34,
> +    };
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +
> +    k230_i2c_write_bytes(qts, base, write_data,
> +                         G_N_ELEMENTS(write_data));
> +
> +    k230_i2c_tmp105_combined_read(qts, base,
> +                                  TMP105_REG_T_LOW, 2);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 2);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x12);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x30);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 0);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +    qtest_quit(qts);
> +}
> +
> +static void test_tmp105_direct_read(void)
> +{
> +    static const uint8_t write_data[] = {
> +        TMP105_REG_CONFIG,
> +        0x20,
> +    };
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +
> +    k230_i2c_write_bytes(qts, base, write_data,
> +                         G_N_ELEMENTS(write_data));
> +    k230_i2c_select_register(qts, base, TMP105_REG_CONFIG);
> +
> +    /*
> +     * Start a read while the controller is idle.  This covers the
> +     * IDLE-to-RECEIVING path without a preceding repeated START.
> +     */
> +    k230_i2c_queue_reads(qts, base, 1, false, true);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 1);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x20);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +    qtest_quit(qts);
> +}
> +
> +static void test_tmp105_read_write_restart(void)
> +{
> +    static const uint8_t initial_data[] = {
> +        TMP105_REG_CONFIG,
> +        0x20,
> +    };
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +
> +    k230_i2c_write_bytes(qts, base, initial_data,
> +                         G_N_ELEMENTS(initial_data));
> +    k230_i2c_select_register(qts, base, TMP105_REG_CONFIG);
> +
> +    /*
> +     * Leave the read transfer active, then switch from receiving to
> +     * sending with a repeated START.
> +     */
> +    k230_i2c_queue_reads(qts, base, 1, false, false);
> +
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 IC_DATA_CMD_RESTART | TMP105_REG_CONFIG);
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 IC_DATA_CMD_STOP | 0x60);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 1);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x20);
> +
> +    k230_i2c_tmp105_combined_read(qts, base,
> +                                  TMP105_REG_CONFIG, 1);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x60);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +    qtest_quit(qts);
> +}
> +
> +static void test_tmp105_same_direction_restart(void)
> +{
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +
> +    /*
> +     * Start in the sending state, issue an explicit repeated START
> +     * without changing direction, and then write the config register.
> +     */
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 TMP105_REG_T_LOW);
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 IC_DATA_CMD_RESTART | TMP105_REG_CONFIG);
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 IC_DATA_CMD_STOP | 0x40);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +
> +    k230_i2c_tmp105_combined_read(qts, base,
> +                                  TMP105_REG_CONFIG, 1);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x40);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +    qtest_quit(qts);
> +}
> +
> +static void test_transfer_status_with_slave(void)
> +{
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +    uint32_t raw;
> +    uint32_t status;
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +    qtest_readl(qts, base + K230_IC_CLR_INTR);
> +
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 TMP105_REG_CONFIG);
> +
> +    status = qtest_readl(qts, base + K230_IC_STATUS);
> +    g_assert_cmphex(status & IC_STATUS_ACTIVITY,
> +                    ==, IC_STATUS_ACTIVITY);
> +    g_assert_cmphex(status & IC_STATUS_MST_ACTIVITY,
> +                    ==, IC_STATUS_MST_ACTIVITY);
> +    g_assert_cmphex(status & IC_STATUS_TFNF,
> +                    ==, IC_STATUS_TFNF);
> +    g_assert_cmphex(status & IC_STATUS_TFE,
> +                    ==, IC_STATUS_TFE);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_START_DET,
> +                    ==, IC_INTR_START_DET);
> +    g_assert_cmphex(raw & IC_INTR_ACTIVITY,
> +                    ==, IC_INTR_ACTIVITY);
> +
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 IC_DATA_CMD_STOP | 0x20);
> +
> +    status = qtest_readl(qts, base + K230_IC_STATUS);
> +    g_assert_cmphex(status & IC_STATUS_ACTIVITY, ==, 0);
> +    g_assert_cmphex(status & IC_STATUS_MST_ACTIVITY, ==, 0);
> +    g_assert_cmphex(status & IC_STATUS_TFNF,
> +                    ==, IC_STATUS_TFNF);
> +    g_assert_cmphex(status & IC_STATUS_TFE,
> +                    ==, IC_STATUS_TFE);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_STOP_DET,
> +                    ==, IC_INTR_STOP_DET);
> +    g_assert_cmphex(raw & IC_INTR_ACTIVITY,
> +                    ==, IC_INTR_ACTIVITY);
> +
> +    qtest_readl(qts, base + K230_IC_CLR_START_DET);
> +    qtest_readl(qts, base + K230_IC_CLR_STOP_DET);
> +    qtest_readl(qts, base + K230_IC_CLR_ACTIVITY);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_START_DET, ==, 0);
> +    g_assert_cmphex(raw & IC_INTR_STOP_DET, ==, 0);
> +    g_assert_cmphex(raw & IC_INTR_ACTIVITY, ==, 0);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +    qtest_quit(qts);
> +}
> +
> +static void test_rx_threshold_with_slave(void)
> +{
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +    uint32_t raw;
> +    uint32_t stat;
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +    qtest_writel(qts, base + K230_IC_RX_TL, 1);
> +    qtest_writel(qts, base + K230_IC_INTR_MASK,
> +                 IC_INTR_RX_FULL);
> +
> +    k230_i2c_select_register(qts, base, TMP105_REG_T_LOW);
> +    qtest_readl(qts, base + K230_IC_CLR_INTR);
> +
> +    k230_i2c_queue_reads(qts, base, 1, false, false);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_RX_FULL, ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 1);
> +
> +    k230_i2c_queue_reads(qts, base, 1, false, true);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    stat = qtest_readl(qts, base + K230_IC_INTR_STAT);
> +
> +    g_assert_cmphex(raw & IC_INTR_RX_FULL,
> +                    ==, IC_INTR_RX_FULL);
> +    g_assert_cmphex(stat & IC_INTR_RX_FULL,
> +                    ==, IC_INTR_RX_FULL);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 2);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x4b);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_RX_FULL, ==, 0);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x00);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +    qtest_quit(qts);
> +}
> +
> +static void test_rx_overflow_with_slave(void)
> +{
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +    uint32_t raw;
> +    uint32_t status;
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, true);
> +    qtest_writel(qts, base + K230_IC_RX_TL, 63);
> +    qtest_writel(qts, base + K230_IC_INTR_MASK,
> +                 IC_INTR_RX_FULL | IC_INTR_RX_OVER);
> +
> +    k230_i2c_select_register(qts, base, TMP105_REG_T_LOW);
> +    qtest_readl(qts, base + K230_IC_CLR_INTR);
> +
> +    /*
> +     * TMP105 returns two register bytes and then 0xff.  Sixty-five
> +     * read commands therefore fill the 64-byte RX FIFO and overflow
> +     * on the final command.
> +     */
> +    k230_i2c_queue_reads(qts, base, 65, false, true);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 64);
> +
> +    status = qtest_readl(qts, base + K230_IC_STATUS);
> +    g_assert_cmphex(status & IC_STATUS_RFNE,
> +                    ==, IC_STATUS_RFNE);
> +    g_assert_cmphex(status & IC_STATUS_RFF,
> +                    ==, IC_STATUS_RFF);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_RX_FULL,
> +                    ==, IC_INTR_RX_FULL);
> +    g_assert_cmphex(raw & IC_INTR_RX_OVER,
> +                    ==, IC_INTR_RX_OVER);
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x4b);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_DATA_CMD),
> +                    ==, 0x00);
> +
> +    for (int i = 0; i < 62; i++) {
> +        g_assert_cmphex(qtest_readl(qts,
> +                                   base + K230_IC_DATA_CMD),
> +                        ==, 0xff);
> +    }
> +
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 0);
> +
> +    status = qtest_readl(qts, base + K230_IC_STATUS);
> +    g_assert_cmphex(status & IC_STATUS_RFNE, ==, 0);
> +    g_assert_cmphex(status & IC_STATUS_RFF, ==, 0);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_RX_FULL, ==, 0);
> +    g_assert_cmphex(raw & IC_INTR_RX_OVER,
> +                    ==, IC_INTR_RX_OVER);
> +
> +    qtest_readl(qts, base + K230_IC_CLR_RX_OVER);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_RX_OVER, ==, 0);
> +
> +    k230_i2c_assert_no_abort(qts, base);
> +    qtest_quit(qts);
> +}
> +
> +static void test_restart_disabled_abort(void)
> +{
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +    uint32_t raw;
> +    uint32_t status;
> +
> +    k230_i2c_configure_master(qts, base, TMP105_ADDRESS, false);
> +
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 TMP105_REG_CONFIG);
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 IC_DATA_CMD_READ | IC_DATA_CMD_STOP);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    status = qtest_readl(qts, base + K230_IC_STATUS);
> +
> +    g_assert_cmphex(raw & IC_INTR_TX_ABRT,
> +                    ==, IC_INTR_TX_ABRT);
> +    g_assert_cmphex(qtest_readl(qts,
> +                               base + K230_IC_TX_ABRT_SOURCE),
> +                    ==, 0);
> +    g_assert_cmphex(status & IC_STATUS_ACTIVITY, ==, 0);
> +    g_assert_cmphex(status & IC_STATUS_MST_ACTIVITY, ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_TXFLR),
> +                    ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 0);
> +
> +    qtest_readl(qts, base + K230_IC_CLR_TX_ABRT);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    g_assert_cmphex(raw & IC_INTR_TX_ABRT, ==, 0);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_echo_data_nack(void)
> +{
> +    static const uint8_t accepted_data[] = {
> +        0x7f,
> +        0x11,
> +        0x22,
> +    };
> +    QTestState *qts = k230_i2c_init_with_slaves();
> +    uint64_t base = k230_i2c_find_tmp105_bus(qts);
> +    uint32_t raw;
> +    uint32_t source;
> +    uint32_t status;
> +
> +    k230_i2c_configure_master(qts, base, I2C_ECHO_ADDRESS, true);
> +
> +    for (size_t i = 0; i < G_N_ELEMENTS(accepted_data); i++) {
> +        qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                     accepted_data[i]);
> +    }
> +
> +    /*
> +     * i2c-echo accepts three bytes.  The fourth byte is rejected,
> +     * allowing the controller's TXDATA_NOACK path to be tested.
> +     */
> +    qtest_writel(qts, base + K230_IC_DATA_CMD,
> +                 IC_DATA_CMD_STOP | 0x33);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    source = qtest_readl(qts, base + K230_IC_TX_ABRT_SOURCE);
> +    status = qtest_readl(qts, base + K230_IC_STATUS);
> +
> +    g_assert_cmphex(raw & IC_INTR_TX_ABRT,
> +                    ==, IC_INTR_TX_ABRT);
> +    g_assert_cmphex(source & IC_ABRT_TXDATA_NOACK,
> +                    ==, IC_ABRT_TXDATA_NOACK);
> +    g_assert_cmphex(source & IC_ABRT_7B_ADDR_NOACK, ==, 0);
> +    g_assert_cmphex(status & IC_STATUS_ACTIVITY, ==, 0);
> +    g_assert_cmphex(status & IC_STATUS_MST_ACTIVITY, ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_TXFLR),
> +                    ==, 0);
> +    g_assert_cmphex(qtest_readl(qts, base + K230_IC_RXFLR),
> +                    ==, 0);
> +
> +    qtest_readl(qts, base + K230_IC_CLR_TX_ABRT);
> +
> +    raw = qtest_readl(qts, base + K230_IC_RAW_INTR_STAT);
> +    source = qtest_readl(qts, base + K230_IC_TX_ABRT_SOURCE);
> +
> +    g_assert_cmphex(raw & IC_INTR_TX_ABRT, ==, 0);
> +    g_assert_cmphex(source, ==, 0);
> +
> +    qtest_quit(qts);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       g_test_init(&argc, &argv, NULL);
> @@ -857,5 +1432,28 @@ int main(int argc, char **argv)
>       qtest_add_func("/k230-i2c/start-byte-abort",
>                      test_start_byte_abort);
>   
> +    if (qtest_has_device("tmp105") && qtest_has_device("i2c-echo")) {
> +        qtest_add_func("/k230-i2c/tmp105-config-read-write",
> +                       test_tmp105_config_read_write);
> +        qtest_add_func("/k230-i2c/tmp105-limit-read-write",
> +                       test_tmp105_limit_read_write);
> +        qtest_add_func("/k230-i2c/tmp105-direct-read",
> +                       test_tmp105_direct_read);
> +        qtest_add_func("/k230-i2c/tmp105-read-write-restart",
> +                       test_tmp105_read_write_restart);
> +        qtest_add_func("/k230-i2c/tmp105-same-direction-restart",
> +                       test_tmp105_same_direction_restart);
> +        qtest_add_func("/k230-i2c/transfer-status-with-slave",
> +                       test_transfer_status_with_slave);
> +        qtest_add_func("/k230-i2c/rx-threshold-with-slave",
> +                       test_rx_threshold_with_slave);
> +        qtest_add_func("/k230-i2c/rx-overflow-with-slave",
> +                       test_rx_overflow_with_slave);
> +        qtest_add_func("/k230-i2c/restart-disabled-abort",
> +                       test_restart_disabled_abort);
> +        qtest_add_func("/k230-i2c/echo-data-nack",
> +                       test_echo_data_nack);
> +    }
> +
>       return g_test_run();
>   }


