Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMG2I-0001dq-Od
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG2G-0001YG-NP
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:43:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG2E-0002s6-AC
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:43:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id i6so408120wrv.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
 b=H8ozIcixUveIbw9k7stg4KdS0gx7rTV2e5s41Gx6botMrAh8hYIIWhIu+AvbtT54dW
 Tl8+brbL8I6gSbmldeLB6TkvxB9mAloeVrSwAdDFUCxAz3A9ONWLJnZnRcf7/3YYCKiI
 mKw5CM9pdGmfYUyVULTwZdtG4Zo2cC0TJu5c2IH8dI7SsNAjx2c3JA5uxkgkaF3syZYO
 bS8qs1qwUmnUfdlgL3bsdR1L8kzzDcc0saGHUOJA/DshHL9WLii6vhGNcqmBnmKhwPEJ
 E/skqUuaJ6aFM7UfknaO/MQDQsX7XIC1JB3/bhICCmdu8qPCP1VV/4dZA8n9iYUOsjZI
 4+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
 b=rZyOT0ljPdHFzFz/zcUnjiivSCeCQvs8X+KyIYvtJN1x1W0AemjH7RKELsCFxz5xs/
 T8l10jvb9ly8WLfAhBLGYO5wGIoTi6DC67rJg3uvMwvlN+sQ4FebVn0vuPRs4+3nWM4e
 wbwezbyIrvdBLrr35K33nJ2RZHYOqa3VPorc1tPkQVMLhm7EiklJ2vOkYEaF5L8HMo1i
 MORKa4SkpYjKVj9BQPsv1JIhPqXrOxBllZblox1F1gb96Fh9rsROQ9XACL2Y1dIaSy/V
 CGrOeREdUEUO7U/K1R+fed06SycBnBpvnFobKyLi+ifAqiY8S4vSvYTCfGaQ9q1m9tx9
 sFvA==
X-Gm-Message-State: AOAM533gq50X5lAh/W8BYednbKEWfH+R+fD6G3O1sJ62oWo2wTdqxbNd
 6Lq7LNlOVL6SPnVvkVgyCsWdbg==
X-Google-Smtp-Source: ABdhPJzDzA0nqf/Zf1bg1Haee/zHM2hXytKc0QH8nIr2MjWxDRi+4jQmQKWadcbSkZgCEwSPJcyooA==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr939918wrn.60.1630701816896;
 Fri, 03 Sep 2021 13:43:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d7sm274068wrs.39.2021.09.03.13.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:43:36 -0700 (PDT)
Subject: Re: [PATCH v3 23/30] target/riscv: Restrict has_work() handler to
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
 <20210902161543.417092-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56180d64-090a-1f6f-5c0a-22387c8a2af5@linaro.org>
Date: Fri, 3 Sep 2021 22:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:43:41 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/riscv/cpu.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

