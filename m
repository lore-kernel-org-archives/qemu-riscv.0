Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDFBC5DF9C
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 22:20:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyd0x-0004CQ-2A; Mon, 24 Aug 2026 18:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1wyd0v-0004Bh-9P
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 18:19:33 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1wyd0t-0000SP-ES
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 18:19:33 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-384422b05b5so398444a91.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 15:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1787609970; x=1788214770; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8LR/AzYacYUAVCZRRgXI27j9+RnZQ7HCQTn2EGohg8M=;
 b=eIGY7TMgZR9Dy9AamYXfIp3Odf7gTPy++dPQpczfSXWoR0wAdYwloLZvTyf6zg805q
 6u9Ln6t7oU/5GCF4H0I9dTiI8I0dRT3Q9BqDTlwzRlQ9TpVT3YJ25sQXq0hZ8dGri4o8
 ZR0ZowU1TbfD5sOqKP/g65aOHGGIFk+HwvgigUi8UYh8RpfracZu03dpX8sI+PD/0CCb
 k+2M4je2N+++f7QWq6V1stUk+B0THSmtCavfdCjEEeME5stDFbol6Eyn8g/DP/0T8FDe
 60IgIiCvKhSJhNtvipxlIZ2/p3/ymz/TQiV4pHDvWWCyDu8RaeDIjaFsskDBj7kRLdY9
 SH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787609970; x=1788214770;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8LR/AzYacYUAVCZRRgXI27j9+RnZQ7HCQTn2EGohg8M=;
 b=q2KzuJNw4wX8KZGnEaVV/OK7xoOpgohz9/Qn9/YZcvgeePDdmI45YAznCULpizIJuC
 OVs7oyurabkWQD+mRJwLmYbbC/sa8CzB3sTa2fzIkvr3X3iA4bjSa5H7SDWlQ5yNjNeY
 0/xVoto4M7cFFohi5rVNrJBJVubNzHl/k+EWqHAnXnx1rbIJJxOYhm39nX0Jn2q5Ts7I
 ozKwX1rZ0CnN8N8xS/BL7h4Le14WxUA2TKIl7pS7G0n2f6KNjaruhXmvw0JWPaG8f6tl
 k0EPE5SchcscQzeCjO5GYUHpq0EKBwud+8Omyd/SJPTNmTJ69sRad2rOf6eLeK/V4hzu
 dRoQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqfqOo3vQEdSk8xP4qOnu92LJ7HAj5plxEdAbPx+e0MXa90LqrsuHOsRAYq1CiHj27sOVYB5BFN4W5a@nongnu.org
X-Gm-Message-State: AFuF++ndTtxeYlNkGunG7cxiQBst+2gDOhcMSiKrAWOsn47XgVAMJV+P
 5lOYz5mPAXEBrTUCjUV9upd3J3/44LkiWNtxif0pri8mQitBJ71ndpXZ6VOCOLfqjBU=
X-Gm-Gg: AR+sD11zERczvEesN+yLHqhgi+u0vOBrlICCJViUxchkKJ2aYprY7hR9wTMU9iLRY+D
 llucg5Idhqhct70thP1M2kUoPcuNd1Qd/zBa9WklCOXwv7ln6/ePAAaKZcDJ+597cfCUhQGZ/5V
 9URn5mmczJZ/FWE59FEwsNOB1GMoNotdAW+/uTl/QQop0a9qc7KHDwI7CWtBJQlcLE3iN1miRme
 zKV6lvuSoofKd0jEss5YUjLaspKynpctfFY83cpuE7ejBeljTvH55ZXhZ3SUV1yWeVdiL6mkh6C
 EcHyhMxwawYrnweFy+uzD0zozOGm2V/EMpHam1HGSLIsKFx0ME0446yR+97iFHfIkObj5ucG210
 eLNt81qZvT9uXO78QJyDAtVZVG3Ond1uYqF+ox7ic9kzUlIzdWSSlnEwIWwf/2CrIzAq1fUqfuB
 TsQYcL7IJbkAqDgPqHaGQe7S5auta5JPaiY/USU6UGRkJy0zxwLCJFepFw6bGccbLpZRct22BXb
 OexPpuwUAnjBnVL
X-Received: by 2002:a17:90b:2648:b0:38e:6a7c:abbc with SMTP id
 98e67ed59e1d1-39647bfad3emr1127785a91.3.1787609969703; 
 Mon, 24 Aug 2026 15:19:29 -0700 (PDT)
Received: from [172.16.1.33] ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39645b3ab63sm1137844a91.7.2026.08.24.15.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 15:19:29 -0700 (PDT)
Message-ID: <ab3dba22-8ba4-479e-ad4a-1877335bb2dd@oss.tenstorrent.com>
Date: Tue, 25 Aug 2026 08:19:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/riscv/virt: Use hwaddr for IMSIC device tree
 address
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 philmd@oss.qualcomm.com
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>, Niek Linnenbank
 <nieklinnenbank@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>
References: <20260824055642.41098-1-joel@jms.id.au>
 <20260824055642.41098-3-joel@jms.id.au>
Content-Language: en-US
From: Portia Stephens <portias@oss.tenstorrent.com>
In-Reply-To: <20260824055642.41098-3-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 24/8/2026 3:56 PM, Joel Stanley wrote:
> create_fdt_one_imsic() hard codes the top 32 bits to zero. Instead take
> a hwaddr and populate both the high and low cell.
>
> Suggested-by: Philippe Mathieu-Daudé <philmd@mailo.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/riscv/virt.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Portia Stephens <portias@oss.tenstorrent.com>


>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d58656f70d1b..b91d5066d8ad 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -383,7 +383,8 @@ static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
>       g_autofree char *imsic_name = NULL;
>       MachineState *ms = MACHINE(s);
>       int socket_count = riscv_socket_count(ms);
> -    uint32_t imsic_max_hart_per_socket, imsic_addr, imsic_size;
> +    uint32_t imsic_max_hart_per_socket, imsic_size;
> +    hwaddr imsic_addr;
>       g_autofree uint32_t *imsic_cells = NULL;
>       g_autofree uint32_t *imsic_regs = NULL;
>       static const char * const imsic_compat[2] = {
> @@ -403,7 +404,7 @@ static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
>           imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>           imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
>                        s->soc[socket].num_harts;
> -        imsic_regs[socket * 4 + 0] = 0;
> +        imsic_regs[socket * 4 + 0] = cpu_to_be32(imsic_addr >> 32);
>           imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
>           imsic_regs[socket * 4 + 2] = 0;


I assume the imsic size cannot be greater than 32-bits.


>           imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);

