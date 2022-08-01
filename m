Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oITd8-0002q5-Ex
	for mharc-qemu-riscv@gnu.org; Mon, 01 Aug 2022 07:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITd7-0002p7-0m
 for qemu-riscv@nongnu.org; Mon, 01 Aug 2022 07:30:37 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:44986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITd4-000684-EH
 for qemu-riscv@nongnu.org; Mon, 01 Aug 2022 07:30:36 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31f661b3f89so105451337b3.11
 for <qemu-riscv@nongnu.org>; Mon, 01 Aug 2022 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/L1qr9Ix5S1as0QZJQfgkZUpxnGlzUboUyuGZUd6m8A=;
 b=Arhx7VRslJnvU5jxnFKxvvTKsX/7R4EyGD1fANcgrMwJSwavG2HxKd4tSz2mF7j7mq
 2XKLd2Nr+2mtYyC0d4oUONkKIXlT9gVLPHQyjFgz+oRtDtUaMPdsyd9l0wLbkeDgHylE
 FTkmSHq2xusFXMi8EilrkcU9boKdW6XNfsS1q7Hg9QZS2xVeDzUHF4ZgG3YCzeE+PgMl
 42U4odnfxxPP5uC5+/+ApPNT4P3tC5hPiUAesk8zN4zcAwlqECVLTKa6emPan1f4gGwo
 d9pgLQjy/StaKSLLbhIfltKa9FpakzSoYO375eIL1Cuy5tpK7NT23kiRWdKp6AwOwtwQ
 cpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/L1qr9Ix5S1as0QZJQfgkZUpxnGlzUboUyuGZUd6m8A=;
 b=c73mm6CXPfHShMeLN10+uRj6onbJk3m+TuWjD20QayJU5guBjPKMnMEBhwjpQoKOYe
 Wc17UQBNUxc/sMyzaqHRbNjO5Nw6EMdMB+U6TFY3TiPnswqvf0g2/IEOo9VIORpp3LpE
 Y4DaURUxX+VVjSF5s+Trw/SLBjT0entKDP2A3p8W1URUiOPEs4+tHdgu38mZZaModNaJ
 X8KvRY7ildNeJad9pCiYSPs+pO9ecaS+kLjxFTn9uKUIMqFBAiGbcYgg/wLr5m5oHoPv
 ZM7jVkC7PU6CyGNbnT25sLu+pXdEfjSfdJo+e5YexuRVZQSre+3iPvSXc838udDcDjzA
 OCjA==
X-Gm-Message-State: ACgBeo0bM7Qv3Ty29U2TBeShmABi6iKwP8NGPWjhiBLyZ3+OeanAeVTS
 yeffGDePj45Iq2N4jqkaLt/Fu9hRfaN94JEI55sSTw==
X-Google-Smtp-Source: AA6agR6B1TBv4nVDR7VVgdrLlsQJ+gdXZ6FT8pPsQqg/8PphtRqWN2a3pPmjDSSh2r4i+jU4IyYzLcLphbDks8cZIQo=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr12686674ywb.257.1659353433230; Mon, 01
 Aug 2022 04:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-4-qemu@ben.fluff.org>
In-Reply-To: <20220727223905.624285-4-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:30:22 +0100
Message-ID: <CAFEAcA9QxwtyB1muGCJh9THdGCu3gEvFAqemvYMUHca6Z1PvAg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/core: use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 01 Aug 2022 11:30:37 -0000

On Wed, 27 Jul 2022 at 23:39, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using the qemu_fdt_setprop_strings() helper in
> hw/core code.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

