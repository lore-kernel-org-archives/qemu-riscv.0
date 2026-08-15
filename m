Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC772C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 13:58:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvEtk-0005om-D8; Sat, 15 Aug 2026 09:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvEti-0005oK-SD
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 09:58:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvEth-0003hy-7a
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 09:58:06 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67FDMU4L279479
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5LWHdVx1Zf4lW3z4pAOhboppNvxoPMiM5ape0K/TM5I=; b=djQh75X3DckF7hG9
 44v4xz12oKv1jqqmx6EaoVGZRviJ+BYED8eXpwo7YCbZZ0nfaZ16LFuTcxtFW3E/
 8EWjDPBuZGb8IuFNdwzdpKhVE4ezZ37TE4SKuHL0SOD6BLgAad1h3rPgMXfkLvIC
 MAm89ifFH21LO4WINFRQ1GNg+7kaNbbxBEilMdKQ8AluPK2kasQw9/GAyPmRCvXj
 AUy+OQrfT4YIC5A3zBQSE3kOe7yYyk5ONR2pWt8CjGTj9dk+2+303ETdFbn2hoOE
 GaqIcXC7YNbXy/gMp0VcBKW3Kimi6wQNusLO8qSqyq8GfW7ZUrbUbEIj/lzxcMWg
 0LjIjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gvch0s5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:58:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52cd0374265so42340871cf.1
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 06:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786802282; x=1787407082; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5LWHdVx1Zf4lW3z4pAOhboppNvxoPMiM5ape0K/TM5I=;
 b=QfsnFOsDc8wkuTWiUtnhvhFcb1pj/45IPhzsMiEcEt+UoZpqPyCzCC+tZIdHNKX5cP
 B/BWlaOMwme3xb1m323gBlqYyJsgru0fwdcDtcVe6mqvCWikkQLXwqCpqgfYE2ZZ5mC1
 wwtHQoIMrEr+cIdI4vTsiaxqgoGIZfF6GdJvt0lzy6efWjI3Cp5G1McxX+yoCU5PP1XL
 DLt0Qw1klCJmZTsOGjDk40DBARtHY+J9l0YRshsmpkPTR57S0fP1pZ0vSKNhoEKPJKWW
 G6U7q2U3gExX0PQ0M9WAJxhV6kQwB9143AHUT0FMf036P3KLvYcP/rC93VRN2rtk9hsg
 rERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786802282; x=1787407082;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5LWHdVx1Zf4lW3z4pAOhboppNvxoPMiM5ape0K/TM5I=;
 b=GXg3UULazX4m7jLvHijPHv5HdFWKsLiAupFDG4EtQUPNwgC6K95kxZf+KICBVAtT9Y
 LUTMP73nrmSwjNtIQicBfvWAlhz/bUAGlA7A4eHn1Jp3lhk5208sKLwOS1RmU5eUteLe
 qUVhFb/cJabU6Cj8M7p+9IOgf9BgdTvXfFyN5o/Il+RdMzfbS9RRDX2FpmDw0eOrRW1L
 KorCzxVOd/R+Mv4zihtPd6/aD/FWo+Fv395AwjRJYdV3TwwOdabI7FpG9UCnEqHFtQh5
 cuf2sY+8JanvYXNpOD/AOFOo7wzpah1SuOSuMMUV+yO6J6ERZSVaG1RZqFfWAM6d1CRV
 RW0A==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro0rYykjM+BIbATyB0Xyu07jRqorUCZ4T5IvrrwxE0SWK1fsFNrxEnjzlv5pFxz37DJLd2NshSkRh8o@nongnu.org
X-Gm-Message-State: AOJu0YxJp6+rbPaVr4mPPJwzKpdL7HgxZYDVaTHNPM0gZUX0t/jthOJR
 VIGDNurZLag2LKMKja5QvPYSId60GHNk47dYDKOu1Cm8O0vT7bhSeepX0VGwTKedDUUrVwr9wn7
 qAKthklCuASJAD4SgUbNhw1GJzCaYxPogPirRU/0hLnVCKnc5egeGE8KSTQ==
X-Gm-Gg: AR+sD10sO3cc0iWBO7pQtSGDsN/yNu8+corJ5FQESBfbhLFkk5idHJVQtXN9SEFJYMz
 byab9tjDmD4U+2N0B+JWbUKIod4EQ4fazedNZ3WKqPQapMYgESNXetFOQRYAaKYtM6auk1OnqDC
 AaIQYIHPxJL8FSClvErGlhtm0oEZwSJRZfgAsMfUn3QdfKK98CoYv6KuaaHJ6ncDMItGH+Vavqp
 XSFrchq2apfqc9vlmZZPl1KeN8PIu1C8Oau+lCORjMvyvR9ot+iDRkmS2qWq8Wc/jfQSJzttSsp
 X8+XvPYvW2RVl4BACbC+aOqNcOYC0ALabzXLC/61HWGmbVgPX9l5iiccVJnPJXj4COxvvqGjQ1z
 N7WN6rPH7p8JuE244MgR3U1/OpSb7XQUN9LQ=
X-Received: by 2002:a05:622a:8614:10b0:52d:8743:bc52 with SMTP id
 d75a77b69052e-52d8743be05mr84968851cf.34.1786802281926; 
 Sat, 15 Aug 2026 06:58:01 -0700 (PDT)
X-Received: by 2002:a05:622a:8614:10b0:52d:8743:bc52 with SMTP id
 d75a77b69052e-52d8743be05mr84968641cf.34.1786802281517; 
 Sat, 15 Aug 2026 06:58:01 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988b25625sm147572165e9.13.2026.08.15.06.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2026 06:58:00 -0700 (PDT)
Message-ID: <0ccb0d65-b185-4700-af98-faa27a806aa4@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 15:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hw/char: add K230 DW 8250-compatible UART
Content-Language: en-US
To: WX Chen <wxchen0913@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
References: <20260808-feat-k230-uart-v3-v3-0-d73b31f0034b@gmail.com>
 <20260808-feat-k230-uart-v3-v3-1-d73b31f0034b@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260808-feat-k230-uart-v3-v3-1-d73b31f0034b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEwMSBTYWx0ZWRfX3KvCypHULfgh
 k/RwFWoXzTrB73qHTntgLoHCm3ftWnO0bSpyKZwjHzNjvdFQWzRSmqYWnmtwA5v2pbCmX8hgf2V
 L5B3dQ4hA6md/MLrvxgqMKifICH1/jQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEwMSBTYWx0ZWRfX346SMuM10b2W
 4bG8NkWvKQWN24lFVRlzgv7dOxARn6ilObPAA/XsC2mTH3ZULnJKb/W56nhI1kp5n77setjjG+Q
 hjf0EyG+/1bPP8SDeZ7s4i9VowgxfCcCn/1RcRyIhNlDpfn07i5BZmxluDhRgAJroVaP7PHKbMR
 4tHB4sUHASfnNtfqE4dmIPj4kJTJVdwDo49kqHUXdlTxsmT8qFfYQgN8swVA9KP25wFwyqZj9jP
 2BiBpP8h2UYzONmK1/gPP4xkTYmvdX7M0j72NJh5Aydh+67Hg+IkihpFO/KcjuKunw4iXh8Sr5Z
 wJPE/XY20ai7IBAnU/vHlwQEFhnM9Cw8TS5VIeIwd2jkQAnbKGo0HmZzlhz3dMrvELVRVdwkWzm
 pcsjLiSR8OeTIVdq2snujyy5Iulc0BornpN9AqXem4Hjm2TUJT93LtAVv6I8o1h9SfXT0eurioy
 m1UWR8sGRed7NfK2RpA==
X-Authority-Analysis: v=2.4 cv=UfhhjqSN c=1 sm=1 tr=0 ts=6a80706a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=moOIGioJgd6YXtDZ1I4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YW3ERuN0oXFAx4UEtpcYe7u-7MGMIw5q
X-Proofpoint-GUID: YW3ERuN0oXFAx4UEtpcYe7u-7MGMIw5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150101
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Hi,

On 8/8/26 04:32, WX Chen wrote:
> Implement a K230 SoC DesignWare 8250-compatible UART controller model for
> QEMU, capable of running the Linux 8250_dw driver and providing an
> interactive shell.
> 
> Implemented:
>    - Standard 16550 registers (RBR/THR/DLL, IER/DLH, IIR/FCR, LCR, MCR,
>      LSR, MSR, SCR) and DesignWare-specific registers (USR, TFL, RFL, SRR,
>      SRTS, SBCR, SDMAM, SFE, SRT, STET, HTX, CPR, UCV, CTR)
>    - DLAB switching; 32-byte TX/RX FIFO; synchronous transmit with
>      backpressure handling
>    - Loopback mode; chardev BREAK routed to LSR.BI/FE via CHR_EVENT_BREAK
>    - Four-level prioritized interrupt scheme (ELSI / RX Data / Timeout /
>      THRE), with edge-triggered THRE
>    - RX Character Timeout interrupt (IID=0xc) with 4-char-time timer that
>      tracks the programmed divisor latch
>    - Busy Detect interrupt (IID=0x7): LCR (and its shadow SBCR) writes
>      while USR.BUSY=1 are rejected and raise IID=0x7, cleared by reading
>      USR; USR.BUSY reflects TX-not-empty / RX-data-ready
>    - Shadow registers alias their underlying fields
>    - SRR (UR/RFR/XFR) self-clearing software reset
> 
> Not implemented:
>    - RS485 transceiver control (TCR/DE_EN/RE_EN/DET/TAT)
>    - 9-bit multidrop (LCR_EXT/RAR/TAR)
>    - Fractional baud rate (DLF)
>    - Auto Flow Control (MCR.AFCE)
>    - IrDA SIR mode (MCR.SIRE)
>    - Low-power divisor latch (LPDLL/LPDLH)
>    - FIFO access test mode (FAR/TFR/RFW)
>    - DMA Software Acknowledge (DMASA)
> 
> Signed-off-by: WX Chen <wxchen0913@gmail.com>
> ---
>   hw/char/Kconfig             |   3 +
>   hw/char/k230_uart.c         | 816 ++++++++++++++++++++++++++++++++++++++++++++

How much this diverges of the generic 8250 model we have?

In order to reduce maintenance burden with duplicated code, the
project preference is to use the inheritance pattern of oriented
bject programming, in particular with QOM APIs.

This model could inherit from our generic model with:

   TypeInfo::parent = TYPE_SERIAL

then override its specific methods.

Could you have a look and justify the full rewrite?

Thanks,

Phil.

>   hw/char/meson.build         |   1 +
>   include/hw/char/k230_uart.h | 198 +++++++++++
>   4 files changed, 1018 insertions(+)


