Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG7Re-000298-Mr
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 18:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mG7Rd-000281-SX; Tue, 17 Aug 2021 18:20:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mG7Rc-0000ia-D3; Tue, 17 Aug 2021 18:20:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id r7so401747wrs.0;
 Tue, 17 Aug 2021 15:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B8syXq/wON7LTURwzevCz5EmrV6lvEq/4r5XnxCZrBY=;
 b=LFQakOQxutgU0qZ5doI8dVlALqQSZcxh97ItO4OeNlEc8bMz0CwfBnAyN0E8UaILAX
 SQn6TAXWfHbzX63FII3ITbmQSTAXewxlwGfp9+praA4tojplfwsr4vSKkCGQG9BLFIcX
 mG9ifNZ5XkbePRSRMmvX7afxhULjv5fLB9SEd850zIvdVa3U/jQ+o5OJ3Ox0EkC005J/
 u7cbDSFyFX/ETcWXs2UodiiADmMdnn6/KCWTC7upWZfStO9foiIyuZuLXb552O04cXhp
 iK1iiumzQv21V6fdWcsKiH3n3mZ7uqeWM15Fz6+58irQV/Dqy3XOfGXWB6WZk0LBi5ke
 1Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B8syXq/wON7LTURwzevCz5EmrV6lvEq/4r5XnxCZrBY=;
 b=sGbOKXiEPkyadoVVoPd21gV4YSmSGV/u8eII5HMjts1bt+6X+JsTEH8bpcqnjryMnT
 FwrX8wyVcC4RGceFaS7Jo1JHG+zq5v5cZ9TYMd4jIRwXJXweDo0X+qCkf72Vomr0ALKN
 DggA8yqF92e2dObJuLxkyuWLwrfXe2QYwvVkUl+wMdhEFgKKAWn9RFbmR+2Dh7sdgv1G
 LDZjP7/IUVYthb/gC9C2y/+rFLMxTf66QR7aHqe+IzUKp4og417huxUg8NHLSb/gKVt+
 KYCWCsMWUE9l9C1s5qYEUpVMoS/oybVbD6Buooxj/j7vf1LXNR25+jjLgO+3mYsMHb5v
 tg2w==
X-Gm-Message-State: AOAM530xIeKZvQoHqdVZfvSTxgOLZVMbD+mYwqYCPu1Xx7H7MXy7R15i
 UkgLrQYOsBqPucieuSMrt+A=
X-Google-Smtp-Source: ABdhPJyU+Ks7+jYfvaH3XYTIM7uWGiY7P1XBbggTRJ8H0HHoi/eoVUOC8LWaaw3MSzTc+nr3dDkdkQ==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr6910659wri.26.1629238826705; 
 Tue, 17 Aug 2021 15:20:26 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m10sm4959864wro.63.2021.08.17.15.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 15:20:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 09/21] target/riscv: Move gen_* helpers for RVB
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 zhiwei_liu@c-sky.com
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e9d2a2fc-5f4a-d316-3dcc-612d8f8a95b8@amsat.org>
Date: Wed, 18 Aug 2021 00:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817211803.283639-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
X-List-Received-Date: Tue, 17 Aug 2021 22:20:30 -0000

On 8/17/21 11:17 PM, Richard Henderson wrote:
> Move these helpers near their use by the trans_*
> functions within insn_trans/trans_rvb.c.inc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 233 -----------------------
>  target/riscv/insn_trans/trans_rvb.c.inc | 234 ++++++++++++++++++++++++
>  2 files changed, 234 insertions(+), 233 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

