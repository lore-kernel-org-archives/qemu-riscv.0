Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goZN9-0004Ul-Ip
	for mharc-qemu-riscv@gnu.org; Tue, 29 Jan 2019 14:48:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1goZN6-0004Tq-Jz
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 14:48:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1goZMz-0006pV-Rb
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 14:48:33 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1goZMw-0006nZ-Cq
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 14:48:27 -0500
Received: by mail-pl1-x641.google.com with SMTP id u18so9819253plq.7
	for <qemu-riscv@nongnu.org>; Tue, 29 Jan 2019 11:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=W7NLTS/ZDBXWAnuYqXY1g4nZ7pzfT3B+nUF5zdr8I60=;
	b=JqazUTuiMt3g5vcQifgX5xEIyJY2GakctyCGpWCfS4h8ST2iq0tuP8/gCOYKA+xYC4
	3XxqX9IKmu8xPuZuW0nSLIf5SA726w9BafwKtfBmn+pd9FxcciQf5Cls+VaL7xwrTVxl
	rwr+prqcP7nNeZaP6OwWswJoYxmMtqDi0DoFqJOeCch933uU7DUzjKZignefw/yRB/k7
	dJTyoQAeZ7FGhATusidjrVnD7+Wmu9GYfW5RzapdK38cCl2aUWB4UiMnBGDX8ZdkeAi/
	1BdUe2l/YdwXDnKGvWJO8s7NTbdarVL39fWhCXNk4PxUEvpZ4EWCIHKJuDKaKkJ0re7L
	wWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=W7NLTS/ZDBXWAnuYqXY1g4nZ7pzfT3B+nUF5zdr8I60=;
	b=IteG11FPCgAdleuHa4ELGPxgNLh73gteWNinlouP2iPyN6BkojZ2cHhH4KfBTlqVmj
	/I5O0hUWhpJdeH5iDMFcLW8TP3Y4OMPQUioKnJc6kvJUsZp+Y9DCGTbotSZOp0vntNUH
	i7Y/b+o7WofBNpxW3OElOlbh1zSha1G2UUja2+iuIvHn+fuU7/gQY/Cy/PSpAES9c4U/
	bVU5ERnCv4aeqd+YzMJohkjzvqPYsY1TOYq1Yb+yiB/sePZQFN8y/P75p/DXVMqB6jIQ
	ChQUw7cnogyTshfcMKaYeyWWYZiI/xZP7rWQ9FNG+ov4CMKCx58RfjuaX/qP2nlrvD/k
	H0Mw==
X-Gm-Message-State: AJcUukcAdvvQ/4rTKLSMgj28fYtz9axXXd5aOlvJYho50Mqo7Pgfw9ue
	bRM2dwLIRFdbn8iXp50KXrIOqw==
X-Google-Smtp-Source: ALg8bN4cZJIUh5Iavh6qGOSbfcMA6h1RymCUe/Y4HGdSxyWAev77/yjCpnhKG0GUnSBVfZvPt2Xekw==
X-Received: by 2002:a17:902:b90b:: with SMTP id
	bf11mr27098617plb.284.1548791304389; 
	Tue, 29 Jan 2019 11:48:24 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	q1sm50220944pfb.96.2019.01.29.11.48.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 11:48:23 -0800 (PST)
Date: Tue, 29 Jan 2019 11:48:23 -0800 (PST)
X-Google-Original-Date: Tue, 29 Jan 2019 11:35:13 PST (-0800)
In-Reply-To: <20190126230256.10983-1-xi.wang@gmail.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, xi.wang@gmail.com,
	mjc@sifive.com, 
	Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: xi.wang@gmail.com
Message-ID: <mhng-e609a948-7637-494a-b7f7-8c23c51dd1a1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [PATCH] target/riscv: fix counter-enable checks in
 ctr()
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2019 19:48:37 -0000

On Sat, 26 Jan 2019 15:02:56 PST (-0800), xi.wang@gmail.com wrote:
> Access to a counter in U-mode is permitted only if the corresponding
> bit is set in both mcounteren and scounteren.  The current code
> ignores mcounteren and checks scounteren only for U-mode access.
>
> Signed-off-by: Xi Wang <xi.wang@gmail.com>
> ---
>  target/riscv/csr.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5e7e7d16b8..133f2ff7e2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -56,9 +56,15 @@ static int fs(CPURISCVState *env, int csrno)
>  static int ctr(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    target_ulong ctr_en = env->priv == PRV_U ? env->scounteren :
> -                          env->priv == PRV_S ? env->mcounteren : -1U;
> -    if (!(ctr_en & (1 << (csrno & 31)))) {
> +    uint32_t ctr_en = ~0u;
> +
> +    if (env->priv < PRV_M) {
> +        ctr_en &= env->mcounteren;
> +    }
> +    if (env->priv < PRV_S) {
> +        ctr_en &= env->scounteren;
> +    }
> +    if (!(ctr_en & (1u << (csrno & 31)))) {
>          return -1;
>      }
>  #endif

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

I'll add this to my next PR.

