Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFjA-0002Qq-DP
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFj8-0002Ki-Um
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:23:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFj7-0003bs-8J
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:23:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id b10so387889wru.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wXBwe+C96NVMAw/WVJPmEePxSXgR8UnAw4mAKidy+Uc=;
 b=QHLQ3rMDWNB/26AcEt/tmQB5kk5HXskxmUCeZxjWkZY+/+gmxKxtLYBbUrbEJ9IIVl
 TXxNm1cMDVlWjjJE1EL8SyZCs1686ubATja87bAh8hUlCMrmrU+p/h2HnsSi4f6M2VVv
 ZijvBz00fTjJ0Pey6nM7GppsZ7HFYqOWG62UIeKnTBmuInsYh9s3ltuexL+iuerhbSSN
 uMg0jOQeNSsrtwUY8ODf5A01NMcBOal5Wp3/QlINZyEPfodQvP1VTMgezqqMzuZLU7iB
 OiJNsnH57C+xyoKu+8wTdisD8sJn3vaHgIGWHGCi7wCCfdTlsvskKx4OEy1NR1/zo36u
 mnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wXBwe+C96NVMAw/WVJPmEePxSXgR8UnAw4mAKidy+Uc=;
 b=qq6LN/NIzP+9pZ1NsnEg96bTtlFSjTYpR5WZwnffXbJBojcmu3LjmynURoczE5EgzK
 SCN6LMAEUVxMy8cxLfjW8+EpdZDYsDs/fXCqeTevw4qK8n4AuM5IDiMzciGSRyS3piDK
 x+aoVlgalTu6NTk7kvVFPYTd1RQzocPLRJe5T50G+cA1uWwHl3hwNf5foXLdu/AU6Z1t
 f13UsN51XriWf2bGLL97SC18iqtIWGyE0y/ilnQtYtjx/0zOndTGRMnkjUlcCZkpoIx7
 feTMPZlHbRxzHei5NW6CZWI+diQ12os6EJ7h3aQ+RlpYlBWPdNdsJze2PvzR8Se0VRz2
 LXDw==
X-Gm-Message-State: AOAM532UODBBYm9Dj2TJCnxEjumUE8kt5nzyEw9NQx2fUlp2H5D58P8B
 dbGvNC+leB9mjANBq2OkkXXwlg==
X-Google-Smtp-Source: ABdhPJz826d62i3FadVITpOZWzNuXjQqqxILWUC/72776fLbfHJdkqtyjig/TilRLtZ8efOdunSk1g==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr839408wrc.190.1630700631792;
 Fri, 03 Sep 2021 13:23:51 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id j20sm258635wrb.5.2021.09.03.13.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:23:51 -0700 (PDT)
Subject: Re: [PATCH v3 14/30] target/i386: Restrict has_work() handler to
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
 <20210902161543.417092-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2796bcf-8358-1faf-cf30-0ad87cd0ac08@linaro.org>
Date: Fri, 3 Sep 2021 22:23:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 20:23:55 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.c         | 6 ------
>   target/i386/tcg/tcg-cpu.c | 8 +++++++-
>   2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

