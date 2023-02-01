Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pN4Yv-0008SG-FW
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 23:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pN4Yn-0008My-Gr; Tue, 31 Jan 2023 23:17:26 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pN4Ym-0001u5-1i; Tue, 31 Jan 2023 23:17:25 -0500
Received: by mail-ej1-x630.google.com with SMTP id dr8so26166539ejc.12;
 Tue, 31 Jan 2023 20:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2FSgpKCnAh2+2iO4tNdmzqlKbbiBDecbNsqymtBYO0U=;
 b=XDQCi+1AprfcvGyQuviP2oQwJrOWuVNQm5NcN3qyxkVHbDMA3EyBRir20ptvzzKpPk
 PKNBskN5B/iygcTWkPNBTseoQgBZlkCpKQykIIzxYCmfHeatTkyInRGGj3f42pj1N0M6
 /OmaI6h7eSENSNZIxPyncN8RG2jIsEhp4/tRdsmLO2jVgw0czYjjg2brW98v/RlPOiFY
 lVhx7SM9+qCVX/PXQ7I67bcv2D/YLjdvT5FOs0nr0HQ7bHF7QTS07Obnv5ZttbrC9n9L
 3PbKvrhQsLq+GJTFI3SPSocKuqW/ZELTqRGCiv79VMHkAjvvClriLzJWKfXC5bVCGSf6
 +5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2FSgpKCnAh2+2iO4tNdmzqlKbbiBDecbNsqymtBYO0U=;
 b=mDzDiTrKh3b/b0pqLfoEkX7cNaruoCodJGr1HGIMPvwvlRt7KEkTZhiVRd9owe7Bdw
 h6ZwlC3UbHdtBqbJlJN5f7PNRQOOFS2x1kcdeziNq7+PJq9mMjWUaboWjM4T5Eg476Sn
 6Tg+WA42CQRNbOznre4Hi8Q9JqjiR2wSFAj9bz2MUiUyofgLznVB85oBQvwNxWe4lrRV
 eQO5T+WMDqHwdEWgPNoqAoGWM2QKA1CCpHOWn6ZZV39lXvzt5GAoKIdhdjjyp/wSsYOA
 +S5tiN15GCTTIr2p8cNTjpkVGbS72EScjlMGNeS7tF3aw/L6h2XweJA4lokV/wvytGRv
 QD7w==
X-Gm-Message-State: AO0yUKV/Iesu6/b09/D0iY17JwDznc38fZQjwwZ8NlvfrAYtZOB+X7SA
 CWhtQc447TEsjE6DpV5lAtiUOBNVaX2qD2V2fBw=
X-Google-Smtp-Source: AK7set9/1JqpMYktngqSM9eennJd6fKgRTG6iRafUsRl/A+n/3M9upXonmk4Q1u9CywWHq/2WsAoDzKNndS/ZJBHMrI=
X-Received: by 2002:a17:906:49da:b0:882:3e56:a854 with SMTP id
 w26-20020a17090649da00b008823e56a854mr233221ejv.263.1675225040811; Tue, 31
 Jan 2023 20:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
 <20230131133906.1956228-4-alexghiti@rivosinc.com>
In-Reply-To: <20230131133906.1956228-4-alexghiti@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Feb 2023 12:17:09 +0800
Message-ID: <CAEUhbmU2Zi2FtfhqZg1S94A3WcJk_Y+SGm+U=_NSY_idxTJ7Eg@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] riscv: Allow user to set the satp mode
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 01 Feb 2023 04:17:29 -0000

On Tue, Jan 31, 2023 at 11:13 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> RISC-V specifies multiple sizes for addressable memory and Linux probes for
> the machine's support at startup via the satp CSR register (done in
> csr.c:validate_vm).
>
> As per the specification, sv64 must support sv57, which in turn must
> support sv48...etc. So we can restrict machine support by simply setting the
> "highest" supported mode and the bare mode is always supported.
>
> You can set the satp mode using the new properties "sv32", "sv39", "sv48",
> "sv57" and "sv64" as follows:
> -cpu rv64,sv57=on  # Linux will boot using sv57 scheme
> -cpu rv64,sv39=on  # Linux will boot using sv39 scheme
> -cpu rv64,sv57=off # Linux will boot using sv48 scheme
> -cpu rv64          # Linux will boot using sv57 scheme by default
>
> We take the highest level set by the user:
> -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
>
> We make sure that invalid configurations are rejected:
> -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
>                            # enabled
>
> We accept "redundant" configurations:
> -cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
>
> And contradictory configurations:
> -cpu rv64,sv48=on,sv48=off # Linux will boot using sv39 scheme
>
> Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 207 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  19 +++++
>  target/riscv/csr.c |  12 ++-
>  3 files changed, 231 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

