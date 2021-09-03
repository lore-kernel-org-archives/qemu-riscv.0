Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFgs-0005Dz-0t
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFgp-0005BX-Df
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:21:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFgj-0001Zg-GJ
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:21:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z4so325749wrr.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q+SSfq4073OmWN5SjfGpr2ImvdVTltAm2Ap93b1Y88E=;
 b=PZ2KiViiXR0yMgtsi9ubJd49eXX8m7kgtJ7JWAf0xocPcQ4Oxw4avSPsHVo9QZcW0N
 BByueunHxBruDfx2gZo+Ix58peWhu5wGIHIMCSjfvS8XdfqDnHodPv7hZLnIQBhld9/a
 y0lWLp8aIQKnuXGpPmhHwQpf/DGQHqb2SPZDygfQELNsjREPaTcvh71MJU4d2M9P2WuC
 AZHX/t3lV1bfa8h49PxfG8kq4e5hCt+9BPtVsMQjLzebnh3VaBZTuTGJBK+rNkK7BCfW
 EvnOQKajlmpMw2NfupoVnEo8oI6UDgZtiqq4mNRFKiSDClkKz+9ZYBjtDFyqInTaIFO/
 szhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+SSfq4073OmWN5SjfGpr2ImvdVTltAm2Ap93b1Y88E=;
 b=qfYws/KGRXOeYl8iXd6gxzTmZYyVGjl+Xfv8MC0bBa1+1PDwkLMaVUejo2fgFgnFL6
 LtiLyEDvC7RFMLJz6akXpyoUMR69loVIuTvFH1VeIFIGo+0/TG4/PEqF4lM6FSBjij1h
 vxxAvtzi2TVyxpEjjUNvSNa7mnBWu4nNXrUyBZZ4jsMmE76CQscQ889UizKazTJDyKNP
 evNcWBSYe2Sd0MfpAU4cY+90crLF+9AN6daQDSH2/abGcbqwH/2T5MptaiCR0desZXp+
 K3P/gvKPeY50fUclm0NUaDyrO45+heR159I+VKcd5sOWDwYxMXefdt3w17xKJH5g8fWO
 LtRA==
X-Gm-Message-State: AOAM530LshjQaAg9MBy9LCA3KukAnw4n2A6KNyEbgkAp0jbWS+Kuartr
 3r+/FLNRa4Gc3gn8/9jGuQihGA==
X-Google-Smtp-Source: ABdhPJyd1De7PuFzuLP4i8MhbWXrBu0OhprhhfEXRkHThwdYNyCL8/AmxbAlET5sIL14xwjI9QRBeg==
X-Received: by 2002:adf:c149:: with SMTP id w9mr804955wre.127.1630700483905;
 Fri, 03 Sep 2021 13:21:23 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s15sm232969wrb.22.2021.09.03.13.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:21:23 -0700 (PDT)
Subject: Re: [PATCH v3 11/30] target/cris: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 Wenchao Wang <wenchao.wang@intel.com>, xen-devel@lists.xenproject.org,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51e42a3f-6064-be49-26b2-20eafd1106a2@linaro.org>
Date: Fri, 3 Sep 2021 22:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:21:32 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool cris_cpu_has_work(CPUState *cs)

No CONFIG_TCG for cris.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

