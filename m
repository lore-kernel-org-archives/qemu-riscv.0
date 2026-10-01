Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F2ECA5FCB
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 13:23:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCGkS-0006Ir-Mn; Thu, 01 Oct 2026 09:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xCGkP-0006IE-NU
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:22:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xCGkN-0004px-GB
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:22:53 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691C4taY1661227
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 13:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AKPhGAM7FUvCE54sUkTTafP4Pcx1epAjLTVFhQAC3as=; b=G3cuyLmCqt9zWJtz
 61AmXqjsYQvug0hi7bwG/uai7QX203lZ1sAtYXIBlYqaGdIPu/tyzaAo5eGQUjlB
 1+eyyVPRnmxBe0j8rGlaZif6PQQYLCNWbFNJhlw0YR1cD0N2rbiVGoeZE78YUXp2
 CXDSb0Iuo9M1tpQQjZKAEHUCJr6vj6s0bpQeMkspiHHFrQ0ycHzopNdkkOrO8hQG
 pjN67NUq/crh3rQr5Mb7m3Aj5/JZOFJpvh/hnw7glLlXbWxSTOWlgPw0MeLJzllh
 EcQJCQQ/pUjevIzCUXGYBHuNc0f5HMGVs1Tc2ovZLHzbyEOm893by5K2wGreiuHQ
 vuKOgA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pmrhd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 13:22:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-9179d9cde17so15931846d6.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790860969; x=1791465769; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AKPhGAM7FUvCE54sUkTTafP4Pcx1epAjLTVFhQAC3as=;
 b=OOBNE+dZFF9HcrHWaQO6tnGtAHLIos7cCo5AQRrUSkDwI+kEpCHfsiMNsRlQcUv+fJ
 rBwBMjnq3zFNJdz0LW0wfxyk6x4NSWU2A/lM/562s0tvwQ72tKa7GryIPJMxVB/fqmUk
 YRRvQQMRD6Rwx07Or6umwOORqzc9p8sQL8INVArDyZoyNbM9xosSxjNGrW+djvQhKUZD
 OUTiZmG2hoi3ufgRw5r9H3dR3MTC54vzsk3FtTKufmvf1IO/N6RFDQGugusMLmt24GF6
 XERTN7EEFQzA2LOgY0fI1kyXrCEWLHpnkJ36hWoxY8h66ZUsHCeE+6bP1UTCeEFHcJEw
 0mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790860969; x=1791465769;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AKPhGAM7FUvCE54sUkTTafP4Pcx1epAjLTVFhQAC3as=;
 b=FjCYSiJ4nL7KL8jAuMKhd/DbpoW+QvfgooM/x8HzbDyCDpOwxqYe4K6jQPnDI0O0KY
 00w/GCDtNo8byIbn8/vidMANWe6bHMXsKHXFXO7XuVOWUbcOrUCr7Cy8DkXCUduV+rTK
 MqdD8WnNVo8/zvHbODeb8/oUs+tt4J17NOI9JmeilXZ8U9zMXQPAa7BBpAMz7/Ofpcs8
 PGQB2nFm2Avs1QiWuccwNWcaHBRPD8Zu+twkeSaccPVi992G/BG/ngJznzK5EjDHZFK1
 SO3n7KE1GQgb7dfxPzOYLvwLOWUt7feubbYrE/LJUDTzcZB/I7lERjQ3ACICCuCoDNh2
 X97A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwQ/FkM0anTLUWjienr9l0WUtq8yj7tgjFYHuTaiYdLd1HfUSuKm9f06RPBMxixlIF3rl8fA4s1DbaY@nongnu.org
X-Gm-Message-State: AFq9FYLTRe3tzIRzVQKDeqv9b47Y+yJVTFA85j+NkNSUZJ7RziiSO5vC
 pAKjzDyg9U1TPFLt+bIF8npDBuqB+xmru9alsty+PlVeLgG8Ci/z3OuMPJVnQTK20z6h+XkNhzQ
 gOybSc/G7NhbeXU8t8klTGvqGBc2oAgPTX7aC7pEips1geOIPE65qbqkjDA==
X-Gm-Gg: AYBFou0f43CBd49LPRE6HC2pkFxWdDwfG/LSPE4tDIJZ5PfoFwQtxbdNpcauEsNyh7c
 1Eh+6pkfzfURuZWzOJ50nWO7e9TgYqKDJnDEhuy7IHPgbzNIsmaVvS07ZqFStX638tYOnL6Se0H
 nDdrz4CeNMXDUig/msOesOGlZkgKFA0g4V2SKC6bLmVS65LEhXHWL12aJdQFcnp/6mkwLnakd/x
 WCknG5B5+YNWq1MXrJSrMPKi0R0azDPzj4fI4JkSTuNrcr05S38hNCJ2+xzE5tSoOP2sqLIr8Lh
 9c1HeqsGUsfHhNHvjzrxVW77FKBRq6jeh9YnsnbrRVp9LbKWSlr+dux/qoFZx8TCaBJKhuQoJBC
 +Mrj1Fb898+1RxD0ZWQ8ssY4w2oZrSrnMdQ==
X-Received: by 2002:a05:6214:2262:b0:912:588d:55e8 with SMTP id
 6a1803df08f44-917a0b2acd3mr83623096d6.9.1790860968596; 
 Thu, 01 Oct 2026 06:22:48 -0700 (PDT)
X-Received: by 2002:a05:6214:2262:b0:912:588d:55e8 with SMTP id
 6a1803df08f44-917a0b2acd3mr83620956d6.9.1790860965697; 
 Thu, 01 Oct 2026 06:22:45 -0700 (PDT)
Received: from [192.168.68.100] ([187.10.234.20])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-917a881d2f2sm26380266d6.7.2026.10.01.06.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 06:22:44 -0700 (PDT)
Message-ID: <9f56dd91-448b-4e71-9f60-e7cb00655aca@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:22:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] docs/atlantis: Update Atlantis UART documentation
To: 'Portia Stephens <portias@oss.tenstorrent.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>
References: <20261001031720.2334056-1-portias@oss.tenstorrent.com>
 <20261001031720.2334056-5-portias@oss.tenstorrent.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001031720.2334056-5-portias@oss.tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P56x2KGl0C-uiU2K_xLw6hhuIwL9OQ7M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfXyadb2NVChHSq
 IBWglLKqcZ0a0SaYTEpNPUdvxiYeezTFV4gSaDEtehODrQ4XEZfVJO3tkSk6A4lgYYGx1OWQjjS
 3T7Or8BbMD8JMVmra3WFV9ZR8JFhtmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX6h2XR+EHsxhQ
 0UUnTlrTpPJ2eVNSZp2RAIOoVfqkrk56OsVxzlhyCy0BRT8YbNoDeFUX9s6kfHP4G669KXeS/Km
 iNttRS4TuNRwuBPGuOf+L7qX3etzll+OVpojv95ip2NGve8Z6S5hEg/QTS4Hi0ULScoq57hHJOY
 Xse7qIPHD6QZIsizO+B9ZxSlHQa0iSk70iJtlotpZ6JdjMYk/dM4iL56V48zyN8CAw1mpvk6nqt
 d90k6o4P4ZyIFrD6rYUiM+FzYkAd6d3osV5xY/DWyYXS5yZMGcw8lKmGlNrrYvDEyMxVDnG//G2
 iI7ZVRCZwWLY0/3+BlGR1rsUTLXuXhVTSw5Y+YTEoymlRZnox98X1CUvLCVyg9aE/fmdI3oNNYn
 w8GvL97aJa0A28ct2nXDLWLSWmtSZhVQRRwllAv0NaxBHYu0ZRkxnlI6xkDNmCHBoAcT8PrJlLw
 mOUsHPpiafrs0yz7rmw==
X-Proofpoint-GUID: P56x2KGl0C-uiU2K_xLw6hhuIwL9OQ7M
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe5eaa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=jbqyKmyYbxlRs/MVMa3Ccg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=kGxUkT7GHAhlYg2gINoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010053
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 10/1/2026 12:17 AM, 'Portia Stephens wrote:
> From: Portia Stephens <portias@oss.tenstorrent.com>
> 
> Add documentation describing how to use the console machine property to
> control the console.
> 
> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> ---
>   docs/system/riscv/tt_atlantis.rst | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_atlantis.rst
> index 1f2880d617..e8176d96e8 100644
> --- a/docs/system/riscv/tt_atlantis.rst
> +++ b/docs/system/riscv/tt_atlantis.rst
> @@ -13,7 +13,21 @@ tt-atlantis QEMU model features
>   
>   * 8-core Ascalon-X CPU Cluster
>   * RISC-V compliant Advanced Interrupt Architecture
> -* 16550A compatible UART
> +* DW8250 compatible UART x5
> +
> +Boot options
> +----------------
> +
> + * ``console`` to change the UART which is on the first serial interface.
> +   Most users will be intersted in the Ascalon boot console ``UART1`` but

intersted  ->  interested


With the typo fixed:


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> +   Ascalon has 5 UARTs and this may not always be the case. The RCPU console
> +   is on ``UART0``.
> +
> +To change the serial console and use device ``UART3``
> +
> +.. code-block:: bash
> +
> +  -M tt-atlantis,console=3
>   
>   Known limitations
>   -----------------
> @@ -24,9 +38,6 @@ real platform. Notably:
>   * There is no PCI host bridge, so virtio-pci devices cannot be
>     attached. Boots that need block storage must use ``-initrd`` with
>     an initramfs.
> -* The DesignWare UART is modelled with QEMU's ns16550-compatible
> -  ``serial_mm`` device; DesignWare-specific registers beyond that
> -  set return 0.
>   
>   Supported software
>   ------------------


