Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxlvw-00073E-55
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 03:16:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxlvu-000720-Fs; Thu, 16 Dec 2021 03:16:10 -0500
Received: from [2a00:1450:4864:20::42e] (port=34787
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxlvs-0002Gq-Mx; Thu, 16 Dec 2021 03:16:10 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s1so8496690wrg.1;
 Thu, 16 Dec 2021 00:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ios1YtB/PN+CFyidgTt3o0C5djrHaDt3cp0Q/so5xJk=;
 b=MZRF7WjpcMC0EoeYHrRvfUNg/qxONWfmpNAevMwyNoHyz9yNHCweKZvvYbZtT3Ylg8
 YcLmsTO+vTy3ojUkisGG7hyaa+ZM4N0X3swqwK3NRu8yYL+ItKgkZHHQKNd/vub/W0tj
 /j3crp6yek2N2tODXPMeH92dPiMR5XrT6NrM2ouqM/145mSZaODHBiDXDiNCy6F3DLyz
 9fXSz2CViwXmyS+dWQ/osjb4udNhJQlqNxf4jJPOqiXvJ9W5ECcPwFyD4WPTbB4bFpDG
 ywt7Wy/T5ui59S1GTrI4vzYiCibbKUEj9kEVZhV1qR27Bzbn7CxHF7jkEyY/Nt6xJPMO
 9bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ios1YtB/PN+CFyidgTt3o0C5djrHaDt3cp0Q/so5xJk=;
 b=IT29MYR89bCvJp9oHERWPgkVr4A9iYfRAVUJBSO2XT20Y6hyM4Lo8Ke8dH9pFmAIqX
 2w9RuCRebdmVTG3h7PQaYBYaX1mMpg0umxhSUX3pwkLfr+0xmOrns8yEXbA9OhZ3IvER
 KdhuUOlnKFx9AkcejwWCTDr8JbL14DQKUptMZ1wriqG28i2xUymXnvzy3u3g2EEzud0T
 CU1cDS9jgZVjyw+oAhn51eV9wTUzx7R1EzFYx+aVVczEapyh6B8RQ7dREWwupvPLrH5b
 qxjWdCgcckLVFgSGBchWorelxJjoNnVkiORPGAySWAQw0SrQ1KfcEf9XlonS1Obiqc/e
 sGpw==
X-Gm-Message-State: AOAM531kOwVACiZX1jFijHmT+84XSds6qMLgNIX2yHlZGrMpdLMNuqA8
 JrwluL+jraJ3J2ldR4fNlf8=
X-Google-Smtp-Source: ABdhPJwZ+9Sfoc+Pbue+7cnVav2njPWDobzBiw/q11TgmfcP0XsAZo3cONy8bfCJlKDbvAi/rh4weg==
X-Received: by 2002:adf:aa08:: with SMTP id p8mr8228589wrd.572.1639642564425; 
 Thu, 16 Dec 2021 00:16:04 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o5sm3937029wrx.83.2021.12.16.00.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 00:16:03 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <5f081604-f7f6-1ec7-d7d2-bfa0be8c32a4@amsat.org>
Date: Thu, 16 Dec 2021 09:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/9] hw/intc: sifive_plic: Add a reset function
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-2-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211216045427.757779-2-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 16 Dec 2021 08:16:10 -0000

On 12/16/21 05:54, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

