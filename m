Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYOVG-0005N1-9R
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 04:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mYOVF-0005Ma-53; Thu, 07 Oct 2021 04:11:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mYOVD-0005q3-OT; Thu, 07 Oct 2021 04:11:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i12so3767222wrb.7;
 Thu, 07 Oct 2021 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A7H8XvaXa7ucTbzDIB24GFjzEH6IxHKnPL0nFUoYcFM=;
 b=pmGkx1f5AvpkscIPb25gUcC83UytMEz48qV/0XXFryx0np8msxcsb2tGs47+wx0lOk
 pEyNFlpUhYTSjqhLAQ1eU/Pu8pAvR/XpOkyjrTbcBHhkcxNxFH53DYMMx51izjEUCJbg
 a4uhZ97t9MyXtTxJ3jYL9FmQwcLUF5spnNQ4pKxLy8iRaiQZ+t4mljVgFQrIAOEM/Lyu
 38EULH3gLhF4CNwI619s1HbKk/lDM7kbNS3/vzSHgVmwo5P7Qs1o2e89SnreMV+1I4/y
 v6DvgOIjWQjcpY60dDhIjVScTpXxUPhTtvmN9O1nGDR5ANZNbTps6QiwOephV+aZMXPY
 yQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A7H8XvaXa7ucTbzDIB24GFjzEH6IxHKnPL0nFUoYcFM=;
 b=demNDnkJfZ/OK8wKIT3K13rK70USHSdUfOVDIozb0TyxTrJfjHIU9xJS5v5aqAhOec
 XRiq42qvtr8Pjxc7CFOd9b/TBp+C+QTDM7QqK/lwjpwOiLLLMiptm4oEzxmO3BkIrOjF
 9o5n0f+ZRxXDPVm/pdSf5IauChfagGNG7tQPzT9DCHQZIkuUyuPOKssIOQXpb6cGYTeG
 8aszZsxuCbXqxnfWduni4+tmph4UWlbhL6kUqQScwQchUBfpvhJP7XnrLxErCn5rWpNP
 wWM5YdWZmU5Gc8BdnTYczDKy5K/8CvjEanOFbgjdrCFavlGyVxfHL4NNyOZn4np9n0Tp
 UQoA==
X-Gm-Message-State: AOAM533OpIy0gSpFf5BsdwGRXJMBOhMxyI36uoRW1k4UTPUp3FoT9Ki5
 td6aBPDw1uFHqurQG5m/6xw=
X-Google-Smtp-Source: ABdhPJynMQyW887sbeVblKZvwzAM6V1gFwRhtPrvGxOE0jHATPK9yHEvVooFrgv16WV56nVDsFYlZg==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr3568836wri.178.1633594302012; 
 Thu, 07 Oct 2021 01:11:42 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t12sm20324291wrw.12.2021.10.07.01.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 01:11:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <a71c770d-9532-4aa9-b77a-59d196d71fc2@amsat.org>
Date: Thu, 7 Oct 2021 10:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 00/27] Adding partial support for 128-bit riscv target
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.964,
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
X-List-Received-Date: Thu, 07 Oct 2021 08:11:45 -0000

On 10/6/21 23:28, Frédéric Pétrot wrote:
> This series of patches provides partial 128-bit support for the riscv
> target architecture.

> For the 128-bit, the tests are there: https://github.com/fpetrot/128-test
> * from hash 925e1af2c7, run the tests in unit_test_i
> * from hash 6d4a39f2c4, run in addition the tests in unit_test_m
> * from hash 864e563916, run in addition the tests unit_test_csr

It would be very helpful to integrate those tests in our suite,
to catch future regressions.

The usual process is:

- Add a submodule
- Add buildsys machinery to call your tests manually
- Add a GitLab job automatically running the tests

Note however we already have too many submodules, so there
might be a simpler alternative.

