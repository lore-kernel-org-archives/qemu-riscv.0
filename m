Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMfMk-0004So-KC
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 20:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMfMj-0004SI-3G
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 20:51:01 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMfMh-0000SM-Ef
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 20:51:00 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x23so2061946pll.7
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 17:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4WdGjKPEfadB50vnPbgYQo+asvma30m3wKJ8Ly+TYrY=;
 b=FjsQviIJEfHVLwCql1YVYk8eRs+WGRkB6ztvm2oBcKRKaUCZ/GY9LEgyTAR0sN4VJ+
 Kk14nnldT2WFfFmaQolh/WUF7nbU4K0tlMovTKRO9tSG3fRvdvtaiCj8XYIRQ5TzNpZq
 gPQhy6S60Jl1GkceyK/fqrhiPhgYlv5qJSh8c+UY95V1NEDD3+hCfBd9SlN1DbUkDpnn
 HUhnAw3qb8TdhZUdq+uKijLJN3bMZMkMiwpc5zXCzJTpuPhFtCKWmjocQ3fV4KESAY34
 dBjcBjmb8qF4jA4va7ZvM9UFQmWFqdxETlIWIdMPi7NJXHyVMDYdFwi1OZYVCS9gL+eS
 A5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4WdGjKPEfadB50vnPbgYQo+asvma30m3wKJ8Ly+TYrY=;
 b=kvFt3v2cQBjmEG4NHknE1yanmBwNSPA/3qnNyUPaszeqQP+bu1jE/Mqc2+CAv5TEXP
 HA4DHjgUvMiBdsg8c0eMYhZ6K+tQNvYzCFbN2CfkdaxhzTIsYlbXOXnok2SQRAmy3EwC
 BelQOo2UynwujxDUroL5wSwF2IR5dpR0hCa/+SB6Y8z34b+tWiV3Z8oUimhoILx2ltEN
 z4EmzqvrAg0dD2ZUWGDtWmM2PbI6XwE1Wig7UJih6LYd3WErqmDhdWc33ROgcfSD59qJ
 XK5XV010QlflSTjrAc2r8PEfFbjjBCu4z2ihCeTneB+fWWKpT+yGcyXUCPL65YRVl1jf
 Gvgw==
X-Gm-Message-State: ACgBeo2LRQfTdXOb/FXG93temSIbW93qV88cPv9SRN3Y7Bl3QiIlIoUT
 yfeuKkA4J7TPmaVPvtGnr2UJzjnmvvz5mbESzzHQ7Q==
X-Google-Smtp-Source: AA6agR5nZFam0JkOH2j0pAZM5FGMPi9e9XJmC092S61qEPj/4UQra7p0/6n3ba9Yq28CcqrQy51KsByhzeMDxUdZ0J0=
X-Received: by 2002:a17:90b:4ac7:b0:1f5:3441:d11a with SMTP id
 mh7-20020a17090b4ac700b001f53441d11amr6536946pjb.182.1660351857598; Fri, 12
 Aug 2022 17:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
 <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
In-Reply-To: <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Fri, 12 Aug 2022 17:50:47 -0700
Message-ID: <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=furquan@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 13 Aug 2022 00:51:01 -0000

On Fri, Aug 12, 2022 at 5:30 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/12/22 16:57, Furquan Shaikh wrote:
> > I am not sure if I understood your comment correctly. Currently, qemu
> > has a check in `riscv_cpu_do_interrupt` to allow semihosting calls
> > only in S and M modes. This prevents semihosting calls from U mode.
> > This patch changes the default behavior of checking `>= PRV_S` for
> > semihosting and instead replaces it with the usage of
> > ebreak{m,s,u,vs,vu} properties to allow the user to configure what
> > modes should allow semihosting calls when `-semihosting` argument is
> > selected.
>
> Why do you need such fine-grained control?  What is the use-case?

I ran into a problem when I was testing a project (with a microkernel
in M-mode and tasks in U-mode) that uses semihosting for debugging.
The semihosting worked fine for M-mode but not in U-mode. As I started
digging into this, I realized that this is because qemu restricts
semihosting to only M and S modes. From reading the debug spec, I
understood that the DCSR presents options for ebreak behavior in each
mode including VS and VU. Adding CPU settable features to enable
ebreak behavior seemed like a flexible solution to support different
cases:
1. Old behavior of restricting semihosting to M and S modes by setting
only ebreakm and ebreaks.
2. My case of enabling semihosting to work in U-mode by setting only ebreaku.
3. Any future case where users would want to enable semihosting in
either M,S,U,VS or VU modes or any combination of these.

>
> r~

