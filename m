Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1ktZ-0007Pd-EV
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 03:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ktX-0007LU-21; Fri, 09 Jul 2021 03:25:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ktV-0004AK-Dn; Fri, 09 Jul 2021 03:25:54 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o22so5730968wms.0;
 Fri, 09 Jul 2021 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ynRwiG9bWVKUGDjrPCP1JTUm3OHkVDhyiQQP1sOObfo=;
 b=paPHh0KwI1SDsNwcOcSiXoUpwjta3WdQ7LWjjWmlOtfiWll/Cgz6tQj6N2Uqhex33G
 sU1mvxmtbUeU4fYdqD4UghEz9t+0JjQH75YLPN/OXroprKVc4jS7FWaW+WSF6pgYGk4+
 r3OqyewX3wlfqTMlEOtQftk6v2aM4DIWYq2nAzy71aZHjeFw2P3HilVZAnCEfA8Puo4D
 8jWEgOpF1dOHz7j2uBYKxh0FvVeGuoJBv6beTzJuvbdxPAqhw9zsh/cZ/UYFlqWw5LOR
 Bi56fltrkR/d5AIsREnZtY1fp8FrD8EavSdupZxr0BsBgrhwgZwJlJqXfa2z9gaSORkz
 QA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ynRwiG9bWVKUGDjrPCP1JTUm3OHkVDhyiQQP1sOObfo=;
 b=LXPx2tC7dDJEukfIciZ26f8E/Wv9QUHTBikUwAZSAXG94XmfPNTAnZ3SEa+/4Sa8QY
 vFJkT6PNKVSkN8W/6xwJEQ9042CE3VGgxhmXSgtT5/fuv+hrvWEsCCOrZtpO9VEl5RXw
 Fx3UqjOm5DXG7wudnKAmMxOWYKxdfSz5p5lS5s6f16BEUQnSYchD/xMM5RxI4XH3aoa0
 HR84ieS0xsDX40HKtqYOQhy+mPUwOYFDlwaFzNaqeMgs6L/JGTaKtuCxzIrdKa7b7qjS
 rvlUuMpnJApgrm0FxnQpOaAPqvTSpC+DWPZm6La2qlp5rur+gQB0hFWIQL4XAaZh8Rlh
 lNHg==
X-Gm-Message-State: AOAM532cvW6ao6I6dl5zsh7p13JENIhquykJtLDj1Ys6hXzHVqOu7s5B
 09YZCBjs/oaZdlS3GybfIV8=
X-Google-Smtp-Source: ABdhPJz2rGDFEz5QaihAQUY7FPpFzgITaetAVI4bgIkjO2Gs/QV0TOs/T5qWQ9zjsP8ECOY4dzzHzg==
X-Received: by 2002:a7b:c4d9:: with SMTP id g25mr7135689wmk.108.1625815551522; 
 Fri, 09 Jul 2021 00:25:51 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm11394434wmq.48.2021.07.09.00.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 00:25:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/5] target/riscv: Expose interrupt pending bits as
 GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6841d467-4401-8dcd-4ac5-1c08166f5008@amsat.org>
Date: Fri, 9 Jul 2021 09:25:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 09 Jul 2021 07:25:55 -0000

On 7/9/21 5:30 AM, Alistair Francis wrote:
> Expose the 12 interrupt pending bits in MIP as GPIO lines.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

