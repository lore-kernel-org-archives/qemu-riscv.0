Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l00zo-0004k8-E8
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 06:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l00zm-0004iL-7H; Thu, 14 Jan 2021 06:40:54 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l00zk-0003oQ-Pq; Thu, 14 Jan 2021 06:40:53 -0500
Received: by mail-wm1-x334.google.com with SMTP id a6so4254365wmc.2;
 Thu, 14 Jan 2021 03:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KqJo3eNaRQ9aV3kJqDaHfVD9Yt30gwPED9wIxMxH9QI=;
 b=MTqOJYJ+7tKrRDzPyvnVKAOo9hS76+lPp4GdP7ikbe+Xya/RmHrbMAXHzQbR/8BpBI
 OmiEJHFOwKsZ7zKrC4WhkX2JwrVVF7je8CRUL8w1qu8qdvl5lK0AhZusms2BoIRDACZY
 riyWdh3lGNusIvl9xLMv7hjo1rU0F3LisyEmOWgS1AxR7zZ1qrj+IvlDF3TY7lQDbliY
 2FmgsHfN8Ce3pygZBCK9ASHrZ1Fv3aI6plVAWEa3KsxBhvzFxx14owRbXZuVdEDI1K39
 MN1um4AmHQTqh6m3T/1JsP7lcaNEOUZovR6zZYLG0vb5xvm4OzWhC72VmLmlvdXR2LDO
 ujLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KqJo3eNaRQ9aV3kJqDaHfVD9Yt30gwPED9wIxMxH9QI=;
 b=Y7fMPwcz+t+jCL21fgm8TKwa/xYNit1D/aZ4VVKGoYtEkwZKUHOeajEyoeallRJQQa
 bZZnNsxmycE+UO9ZycETHOnZMeF5JVW0S5lmIfmlVScSuqjjsx5F8bt4OzSp0XSLRDcU
 D+ZER+7v6KUb7xAODSudqLl/iuN4ewNibNYz/Ur3A3XYbWyqgDeazJUkODx1l6luZf2m
 K7mwXClVDgvjOBQTv28H5owOtDeJePC4Ie+eTPXosMJwzSsXkaUuS0VITf6btcilvek7
 YouV+DswmWdZqEV5z+GGxmBDJoKYVVu5W9FQAnxcLP6fBXbyaMfPZr9n5h2s4iZ+tIsf
 e1ZQ==
X-Gm-Message-State: AOAM532GSB9/Z+vmVA95jrasFMH6bgx2iD6Fk60QgWu1cczzlXkxTEHE
 2v5hu36GTaVQtYttjSUk3Wg=
X-Google-Smtp-Source: ABdhPJx40Ai/PvoC6LThRZnp93F0YWIt06rXVDtfiQVf4n+P1kPuqyQm0RGDnd5cqCMYkZtaaW3xpQ==
X-Received: by 2002:a1c:9ccd:: with SMTP id f196mr3596763wme.82.1610624450128; 
 Thu, 14 Jan 2021 03:40:50 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i16sm8718964wrx.89.2021.01.14.03.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:40:49 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 09/22] hw/sd: ssi-sd: Use macros for the dummy value and
 tokens in the transfer
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-10-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <990308d9-01a2-1904-4b6c-969fcbd43557@amsat.org>
Date: Thu, 14 Jan 2021 12:40:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201231113010.27108-10-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 14 Jan 2021 11:40:54 -0000

On 12/31/20 12:29 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the codes use hardcoded numbers (0xff/0xfe) for the dummy
> value and block start token. Replace them with macros, and add more
> tokens for multiple block write.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/sd/ssi-sd.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

