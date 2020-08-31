Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCs1t-0007lI-Uk
	for mharc-qemu-riscv@gnu.org; Mon, 31 Aug 2020 18:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCs1s-0007kU-6e
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2020 18:11:56 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCs1p-0007fa-Nv
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2020 18:11:55 -0400
Received: by mail-pj1-x1042.google.com with SMTP id o16so656629pjr.2
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2020 15:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PH2RCbNEIaLhQ86NxGfy7qBIeGRthZo3i/8Dmi3lax0=;
 b=KvnRRUTnd/5QvDOn6OMc5rfq5gF7hJSDAC4DssiiKpDawFgv/IjxYfzaPuueMJK1dw
 cRuaY+H1utJG+L/oyhWvZsyShv7WMEwK4lmKw8QJ9+W3hiMwbLyKYyDNNQr1yG1B5a3q
 7FNPxs88Eq0Glz9weNy0J+E5x+/YXFGQTPh8pNdqr3BIk+Ydtzvuv1+t1GDLpOVquovq
 +bSwMx8jTqfXHDZzbG/E5FCqsweQrUSLyGoD+GDpCyzDB0kQVlsM82yJdOwOa8Zly+Uq
 /TasIU9Q7OvkxqPUSW5e09fkeJOH/cysg9SH79ptf530yVeiuMnFRDfOztoGf5x9EVAj
 7fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PH2RCbNEIaLhQ86NxGfy7qBIeGRthZo3i/8Dmi3lax0=;
 b=MG4SHVm1I13YiWasx9mzC+18dbB6/6qHeSxFVh8tm1Ur+SL91istCotBNGKZHqwTJh
 JMogKSFZs7ld1p79E3dUHJ8XAwx9sVh1lJOnT+glW84msfB2Q4b0TxgN3GuQz30JItmN
 6ZiXTX0USlBpSgDNId4VCLvyi9Jt+W+4aJLeQOmJWp8rvqRQHXfxc3TNKlF+jlQedHNj
 zvCOiMow1YvPQtIlHI9NfeU2YYUYpkUleeBArJA4vsG1dWiNTU/4HoHjSbWUlnUEjAsb
 3ZXQXZnaejloW5iGxvlON7lbEqLbxoXyzR4dnhp+/mTafsdV0PMYSmY14jspPoa4ZvPB
 9q1g==
X-Gm-Message-State: AOAM532pdNiHhsXRf8Ay0yXPQdN/+Edo+38ePI6XmU/5Fyf3WYYPgvfP
 MnF1ssrkVkWYWP9NRnWPXc0Cgg==
X-Google-Smtp-Source: ABdhPJyHeAhyq90Hw33BP93AMzx+wEo1MdvVb9FmV0StgvoewtulFfAzNG2O4KMOTxThoXtAhLT44g==
X-Received: by 2002:a17:902:6ac9:: with SMTP id
 i9mr2726606plt.128.1598911912064; 
 Mon, 31 Aug 2020 15:11:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 2sm590033pjg.32.2020.08.31.15.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 15:11:50 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] target: Push BQL on ->cpu_exec_interrupt down into
 per-arch implementation
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, pbonzini@redhat.com,
 Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 peter.puhov@linaro.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20200819182856.4893-1-robert.foley@linaro.org>
 <20200819182856.4893-8-robert.foley@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42dc8454-9835-fc52-a7e2-73835672f3f9@linaro.org>
Date: Mon, 31 Aug 2020 15:11:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819182856.4893-8-robert.foley@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 31 Aug 2020 22:11:56 -0000

On 8/19/20 11:28 AM, Robert Foley wrote:
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 499a8bdc5e..c4e54baa6f 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -599,7 +599,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>             True when it is, and we should restart on a new TB,
>             and via longjmp via cpu_loop_exit.  */
>          else {
> -            qemu_mutex_lock_iothread();
>              if (cc->cpu_exec_interrupt(cpu, interrupt_request)) {
>                  replay_interrupt();
>                  /*
> @@ -614,7 +613,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>              /* The target hook may have updated the 'cpu->interrupt_request';
>               * reload the 'interrupt_request' value */
>              interrupt_request = cpu_interrupt_request(cpu);
> -            qemu_mutex_unlock_iothread();
>          }
>          if (interrupt_request & CPU_INTERRUPT_EXITTB) {
>              cpu_reset_interrupt(cpu, CPU_INTERRUPT_EXITTB);

I think you need a change to patch 5, because this patch reduces the scope
further, around cpu_interrupt_request, etc.

I think patch 5 should have

+    bool success;
+    qemu_mutex_lock_iothread();
+    success = cc->cpu_exec_interrupt(cpu, interrupt_request);
+    qemu_mutex_unlok_iothread();
+    if (success) {
-    if (cc->cpu_exec_interrupt(cpu, interrupt_request)) {

That way this patch maintains the scope of the lock.


r~

