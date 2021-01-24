Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3jJp-00009l-0V
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jJm-00006p-2l; Sun, 24 Jan 2021 12:36:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jJk-0008UQ-Cs; Sun, 24 Jan 2021 12:36:53 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 190so8622883wmz.0;
 Sun, 24 Jan 2021 09:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2nD1tccC1XSpyrvqEPyZ6OMmMTtzPyyf9TCyyxWYzDc=;
 b=ScrDYWiyAkQHBOBM3ypoqJA5nAdGkIeuWbV9DpK68+89Ni/7lX5x72sqEjzRBvorD/
 ejY5t/0GHOvBlgOjyS4TePVSOFvUk6nTIj5H2Y+9tzvDy6lq/wjUstdUDrUQ2W946MXy
 z7IVkPEDZqtOlJ0dYasrCnK13m+DU8DW+Du9sGG905WbHr139v2rUphBjxE8qA155VrC
 qJ89ocRLei3Lny4AUjfNVhr3F9XNti78qpHOG6S9wTIipAadysu6bc5A6F8WOnos95Hc
 Fvm8OcbyXxjBcKMhK4YBZiiOPgZ7AUYvDa3b5hkaYB+NWOeB3W6veQ3udNXyxn8rOS8V
 uGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2nD1tccC1XSpyrvqEPyZ6OMmMTtzPyyf9TCyyxWYzDc=;
 b=GXZxEfBVSTrxJPnD7hz7owFfMJWDgzQdId/QE29BaQgy4iDQPC41KidP23bSWlA8RT
 9jOU8xe5uJ+ffD70yUvh9a0B6jD2QME7/cFylxKsmOWEsGVcOQ1jdPzt5BTcs80WZEnC
 IKQR0VFvJuo8lT7mfyDbtGvBnEXyfw5JQKclpI+WztaZgzhPmWw4bkBSoX9/9+H1J7ar
 o/L5gEgBnebHn32j3Jc+OlPGdF0zTyN5iB16FE9U8rQnUMUiV5Dt4dHGqvrAtktTA9X6
 l9XkQfdx5DgfcNZ0o1ySmTP137Svh40vIyoasnyhQ/N0wTT6dyXn8f67m/0HLOVbGKGI
 slGA==
X-Gm-Message-State: AOAM5330959gl1dK7frN2QDMGFq8YrkLq76Z6SwjtwQs4kzWQpRofgj0
 1q9dtF5vjxFaOHwZ4gk0TlE=
X-Google-Smtp-Source: ABdhPJwhWa3B0mv7qkmdVruz9SH+Ci1+1UltJDeegWTUi1bcIXyR9wweFAURDRJlAkPQ/WaK0f5FKg==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr1020728wmb.108.1611509809462; 
 Sun, 24 Jan 2021 09:36:49 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o124sm19081298wmb.5.2021.01.24.09.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:36:48 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 11/25] hw/sd: ssi-sd: Use macros for the dummy value
 and tokens in the transfer
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-12-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <24e0dacf-eced-49d4-5e93-4081443d0f03@amsat.org>
Date: Sun, 24 Jan 2021 18:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-12-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jan 2021 17:36:55 -0000

On 1/23/21 11:40 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the codes use hardcoded numbers (0xff/0xfe) for the dummy
> value and block start token. Replace them with macros.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> ---
> 
> Changes in v2:
> - Move multiple write token definitions out of this patch
> 
>  hw/sd/ssi-sd.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)

Again:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
https://www.mail-archive.com/qemu-block@nongnu.org/msg78880.html

