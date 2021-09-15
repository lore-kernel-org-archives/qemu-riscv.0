Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQP7z-0007hg-Cq
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP7t-0007gq-CT; Wed, 15 Sep 2021 03:14:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP7q-00041a-EV; Wed, 15 Sep 2021 03:14:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id q11so2180804wrr.9;
 Wed, 15 Sep 2021 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ifroc4q2PMMO0MieFMbm9026p8tS+NvoLcpEN2fm1ek=;
 b=EbR+6OJEolODdYV8fLnW88s4QmYIudGWHQzE/v/eAKNT1aPeHVnBpZ0QO8ScZK5vtk
 fjjrsFg6GYCT/FFGvskxY//2B39W/kpB5rtjSZq9XsoZuHlnBMZ8yMd9snsGmTaZK7VQ
 I/zPFhOx5pxFcLFZ1got+wZ4Lye4b706swOrHOadWXnDo8hopzRCQCj5ErDL8WiARvYz
 53kRqSsijlofnBEPjvK1pmGNYRBH7Vvfhp2I6jMxRFkm67MVja1oeRDNv0gozEFkN+6g
 5os5LGUmylKmJrOsM9s4xQ/cqqGEVlSv4TAx1oPl765qWCuEPsjHipXewj/hpCGN3fSS
 piiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ifroc4q2PMMO0MieFMbm9026p8tS+NvoLcpEN2fm1ek=;
 b=b0fwfmizbftrNcQ2wB8oLOhZNjVbUGvVe86Wk+Wo4uOdXP1tPkgJKo6mH/MqMD7Bqt
 Dch1XrrgWFXKVvlgPoh8p19krnuy/K6U9Q/qrTQBEEScx1ghWYUkyo9Bwfk03cmC/qL5
 +g6TyEqM/pZIJCjbIsVTpDf8vfwY8JH30hxsgD0jElDUWv24AHT/rHJr7Qi+ydEYLCdK
 /fnQDycRF7hE7YSQIravxcJpJF6EqdVFlirDfZXljuFmga0zfUjOMKib+t+YKZ7HI274
 phI0jYJ4N4ukP+WuNtfUtXTvJpFd+vwO4AEC9Ub32LfcaJHhEhxW6bIPtvXhux6nDUu1
 L8Hg==
X-Gm-Message-State: AOAM53304W6KyB/IwPtVxCK1Jy+avdha15Lt1Vxh3OWfeTNSAIX+q0B3
 Ry54Q7C+kiXpP9AulHnTVms=
X-Google-Smtp-Source: ABdhPJzSjV745f7UuXHRZrQ/2N6egsC9EToUP3qEaiMv8qrIFenHU6h5qIFitALhahLa8P4JkpXxdA==
X-Received: by 2002:adf:9f51:: with SMTP id f17mr3226768wrg.301.1631690069993; 
 Wed, 15 Sep 2021 00:14:29 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id k4sm3304904wmj.30.2021.09.15.00.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:14:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 12/53] target/hexagon: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-13-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <62c53681-e552-4601-14e1-db541a08c214@amsat.org>
Date: Wed, 15 Sep 2021 09:14:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-13-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
X-List-Received-Date: Wed, 15 Sep 2021 07:14:41 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/hexagon/cpu.c | 65 ++++++++++++++++++++------------------------
>  1 file changed, 29 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

