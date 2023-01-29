Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pM0g1-0001Hd-RV
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 00:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pM0fx-0001HB-JU; Sun, 29 Jan 2023 00:56:26 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pM0fv-0001eX-QE; Sun, 29 Jan 2023 00:56:25 -0500
Received: by mail-ej1-x630.google.com with SMTP id hx15so4101716ejc.11;
 Sat, 28 Jan 2023 21:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XYWB9B1ZX+RZJQntxZ+410i6V5CtHXo9yrcouZUp5Hs=;
 b=Yl2WQHi5NCfjSUzHdGwt5lok+sGD2lHQnwbTxxG83Pv+4y5xDOKmsQndUT7gfUfDXM
 RHTCICzFUe/V36quq5N0Ej8uxN/d2aEHF/CXHx070q40Zx0J4e03LVbbHUrWskZyOjX3
 xYGypElgEcjtTBiohP9Mn9xKQooYgyIT6SphPkl5RHIuKs/kRGlsFAOmrXDiVHj/8BJK
 AcZ/z9LaILFL0jOyTtCE4iq1oUxJX7sIKbl7QTEymjMKsaXB09zb/Zddblt0t6WyeILs
 LxeAXEdP0q+zucDogYMVXhhtzfjrlBlKUPnSytUIQNJ8lwOGqXhrEU35r3Ap9lapKuKf
 ht5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XYWB9B1ZX+RZJQntxZ+410i6V5CtHXo9yrcouZUp5Hs=;
 b=7gt+UKczQJo2bqpwu1PVXhgBMe5iuvrCECjeB3mPjIdDb/kBffP+nUiwzS6Q5h9tZT
 XexAeWaLHjQqc9vg+ccp0zKMLoH5EOuE79Z7SsPZlnW3fhH7hwkCQ4gkdj14q7oRyXrA
 O8PyKQsffoVC9MxS4qQCmIdeZttcCnAKzVkbtHF5qHo0np8pgoFlTzIk58ALcDwkOHLY
 DoOcl597Jt5/nfbT0r4H68l7mQxUGladA9mY3fg871C46BHK/6Msce0m9qi+xcrW3a+b
 ize/c1FMwuz8A3cZ0qIOd5OTVkAtVP9ZY99tTQNHipMlSNJPQzAc7kLCUGhPBP8SnHB5
 9DzA==
X-Gm-Message-State: AFqh2kqtnPaJvJvdNeD/Co+HdnRTSOcfsBjkLLkRDxL5mFg+ijNFxew4
 MxJ+safth8wC4dPs6GZP6Z4eecEmK9hncxsoieI=
X-Google-Smtp-Source: AMrXdXunkINYMgPaQTTbCmE4g2aSlO92W54QGMMHS+9K/EArN8NV3eYXo05L/9PsocMbaJMfhT0P79eKMQCkNWdiuJs=
X-Received: by 2002:a17:906:a00b:b0:7c0:beef:79e2 with SMTP id
 p11-20020a170906a00b00b007c0beef79e2mr7945464ejy.148.1674971764326; Sat, 28
 Jan 2023 21:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
 <20230125162010.1615787-3-alexghiti@rivosinc.com>
In-Reply-To: <20230125162010.1615787-3-alexghiti@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 29 Jan 2023 13:55:53 +0800
Message-ID: <CAEUhbmXRekF62DWEEaBigZMUyghy7Wo6G7XGHjVq_hnZt_uCNw@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
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
X-List-Received-Date: Sun, 29 Jan 2023 05:56:26 -0000

On Thu, Jan 26, 2023 at 12:22 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> This array is actually used as a boolean so swap its current char type
> to a boolean and at the same time, change the type of validate_vm to
> bool since it returns valid_vm_1_10_[32|64].
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

