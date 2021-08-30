Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKowT-0007Az-FC
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 17:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKowR-00077g-ER; Mon, 30 Aug 2021 17:35:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKowN-0000DL-2k; Mon, 30 Aug 2021 17:35:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id n5so24302296wro.12;
 Mon, 30 Aug 2021 14:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QH8MidZXhGWCiXc025Nc5+/FLqI76MSoaomnrCApeyQ=;
 b=LRNTY/1+9XSFX45XhH3dmNlpPFL3jGapoMB6/Iug/Zzk0CBBVBrQmZRHtM1TsNEXaY
 qhIZpgImOhMAUSQRUZ6kVrbzXx0rRaggfqzLyuclSWyqulo8cZIaMm9mIfanrjwtnw8e
 eAKXNSOTJdF6XGLLFVM8WRGUUfadK4rghucQnOnqBxa2GLdTwpaQpG2VhX8lttFVY0EC
 Jz+fCjO4B7ayc7QfjeMwcn7M2aqpmSR/+nMwpD3ISbWfsKLLQft+lh/0+sc9IqrwNgAP
 cNLChy2W1uC3sME/xMrPkPmWnwD7LNAP6h6/Z1VlnLwOK8zz09oHrZ+HkaEEEoMPaE5Y
 oMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QH8MidZXhGWCiXc025Nc5+/FLqI76MSoaomnrCApeyQ=;
 b=tqJIwVEHwnhmciCiswo+DIklQobAmaKYjpZ0NrJ/nVCE9m4RdGRvsrkVS37XGnrEe/
 ek32waBct9e5bA7Dn0k5PgvsRPsTQNruV0QsrO+rtR1euiMlo+XHe/ioAAznlb+s06vr
 A9DReRdZgAdGyYfC1d3iXEdtPoY5MOxebpr+uroGSLqkNNnDzy4Z75W4XA0ans6IgluH
 ceecpdSYlxAxwj97uTfSLRhAz+KJQor+1SF2uCpkF3dlxyNrBZqLoMx4s7M23fqN8yDp
 h/d7pXpmoKRXbmdEODyQe8tU4Tk2OK5RlE5SHh2SEr+AHGD6GKyUkfKKDgdNBnzJKkZX
 dSdw==
X-Gm-Message-State: AOAM533m9xj3rU87DgeYjMZnCvi/m1rXFu7UI+Y9KkXqk9Bpe2x99p8O
 OS0qw9uU0C7rs0xi+al5qrQ=
X-Google-Smtp-Source: ABdhPJxKu69MVwDzLb7YeVrHu1LNnYlFwcnkQwt1ESFvPh55p1m7bzhlldvRtn+VgqCm+/sMqZ9ccQ==
X-Received: by 2002:adf:d193:: with SMTP id v19mr10340157wrc.377.1630359337244; 
 Mon, 30 Aug 2021 14:35:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y15sm16110825wrw.64.2021.08.30.14.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:35:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 3/8] target/riscv: Addition of 128-bit ldu, lq and sq
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <343cc196-3d69-6785-9228-3edbf9645041@amsat.org>
Date: Mon, 30 Aug 2021 23:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 30 Aug 2021 21:35:43 -0000

On 8/30/21 7:16 PM, Frédéric Pétrot wrote:
> Addition of the load(s) and store instructions of the 128-bit extension.
> These instructions have addresses on 128-bit but explicitly assume that the
> upper 64-bit of the address registers is null, and therefore can use the
> existing address translation mechanism.
> 128-bit memory access identification and 64-bit signedness is handled a bit
> off-the-record:
> MemOp reserves 2 bits for size and a contiguous 3rd bit for the sign, so we
> cannot simply take value 4 to indicate a size of 16 bytes.
> Additionally, MO_TEQ | MO_SIGN seems to be a sentinel value, leading to a
> QEMU assertion violation.
> Modifying the existing state in QEMU has a great impact that we are not
> capable of fully evaluating, so we choose to pass this information into
> another parameter and let memop as it is for now.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  include/tcg/tcg-op.h                    |   1 +
>  tcg/tcg-op.c                            |   6 +

Please split in 2 patches, first TCG generic,

>  target/riscv/insn16.decode              |  33 ++++-
>  target/riscv/insn32.decode              |   5 +
>  target/riscv/insn_trans/trans_rvi.c.inc | 188 +++++++++++++++++++++---

Second particular RISCV implementation.

>  5 files changed, 207 insertions(+), 26 deletions(-)

