Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQQnh-0007A1-QO
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 05:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQQnX-00077L-QH; Wed, 15 Sep 2021 05:01:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQQnT-0002T1-5h; Wed, 15 Sep 2021 05:01:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id q26so2636891wrc.7;
 Wed, 15 Sep 2021 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j3jtMg6tDjm0gVjE3OELyjopFcMxx8AQlZ8vd5URQO4=;
 b=mahtxW9eOWHlVnUMrr5PBLIonqPktxsxGYL8SP3V6/6UvXQ9b51bBo3bdSxxcGpBn0
 rmTTZrlpx7dT7IxKMyOcfab3Z1ICBxNSMzZmixPiULi75qr9bUW+wkTOerGBJlvbXAnp
 2dvturD5MGs+S1pEkPqTi93njSD6iVRgp1hd4L+6sz5WBfVBXvBtsvKAKDIrXaEvhKQN
 DtDya08NN7WiorUsS9LOy8vFSeAFn012qh9K9tTYZyPuPTIwyD+dvthUe66WmgpdRn+o
 s81U0tG+eDVR+VhTsC/IMLhH9M915yjPilPTUS4q7RMtrJcleg/QpaAjpDkCYqg2WjGG
 ZmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j3jtMg6tDjm0gVjE3OELyjopFcMxx8AQlZ8vd5URQO4=;
 b=SvlSdY3LPpbST/DMZ13558m3+lUXHMarOgDAtKuC3fkDvpEaZ3DPHYG4mjZg2IvPah
 xubIFiBq72BLnSt1qCVnJOiSs8hXqdzOuYTtGuOh/BpPyQJBm0eA/uuidsxxyw5P7nmD
 o5tfRTm6t2Lj6kC84e8TSYsBKwq6j1Wj0DUz2DhmM+zpxIUiOtrSzcchkV7uIHBrQz9Z
 9BFQwzh98GZ0H0wLx852polua+RYaWMLryW5vgDC/cdeiPub95eHzDhmN4a1Xo7SuC4l
 P3TYMMjKa3HJjcAc1l27/ParOCjA8LD49cmdvLkjZH3+nnoPkkPpVYn9/ab4flWm82ay
 vi8Q==
X-Gm-Message-State: AOAM5304MKFmXtB2o6eRSFBXvv1MtOVbBKyK75kCk4Mnu7SDHNTkqWND
 lvbMWfiZfcisUA4GNEZeeWU=
X-Google-Smtp-Source: ABdhPJzQNwbb4RwLbLsi8Q7aSnJBvaJWo3+mB7NnOB9zEfDejOQWBlcsoJVDwAcdy5UE9FOG2iXE6w==
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr3644881wrf.312.1631696496278; 
 Wed, 15 Sep 2021 02:01:36 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id c14sm13169948wrr.58.2021.09.15.02.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 02:01:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 27/53] target/xtensa: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-28-berrange@redhat.com>
 <1cb38e8f-cc05-461a-c722-efb18519f6fe@amsat.org>
 <YUG0YwV1om2bmD9L@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <02d057e4-87c5-318a-c3f4-41512b198169@amsat.org>
Date: Wed, 15 Sep 2021 11:01:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUG0YwV1om2bmD9L@redhat.com>
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
X-List-Received-Date: Wed, 15 Sep 2021 09:01:49 -0000

On 9/15/21 10:52 AM, Daniel P. Berrangé wrote:
> On Wed, Sep 15, 2021 at 09:32:38AM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>  target/xtensa/cpu.c       |  2 +-
>>>  target/xtensa/cpu.h       |  2 +-
>>>  target/xtensa/translate.c | 45 ++++++++++++++++++++-------------------
>>>  3 files changed, 25 insertions(+), 24 deletions(-)
>>
>>> -void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>> +void xtensa_cpu_format_state(CPUState *cs, GString *buf, int flags)
>>>  {
>>>      XtensaCPU *cpu = XTENSA_CPU(cs);
>>>      CPUXtensaState *env = &cpu->env;
>>>      xtensa_isa isa = env->config->isa;
>>>      int i, j;
>>>  
>>> -    qemu_fprintf(f, "PC=%08x\n\n", env->pc);
>>> +    g_string_append_printf(buf, "PC=%08x\n\n", env->pc);
>>>  
>>>      for (i = j = 0; i < xtensa_isa_num_sysregs(isa); ++i) {
>>>          const uint32_t *reg =
>>> @@ -1340,55 +1340,56 @@ void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>>          int regno = xtensa_sysreg_number(isa, i);
>>>  
>>>          if (regno >= 0) {
>>> -            qemu_fprintf(f, "%12s=%08x%c",
>>> -                         xtensa_sysreg_name(isa, i),
>>> -                         reg[regno],
>>> -                         (j++ % 4) == 3 ? '\n' : ' ');
>>> +            g_string_append_printf(buf, "%12s=%08x%c",
>>> +                                   xtensa_sysreg_name(isa, i),
>>> +                                   reg[regno],
>>> +                                   (j++ % 4) == 3 ? '\n' : ' ');
>>>          }
>>>      }
>>>  
>>> -    qemu_fprintf(f, (j % 4) == 0 ? "\n" : "\n\n");
>>> +    g_string_append_printf(buf, (j % 4) == 0 ? "\n" : "\n\n");
>>>  
>>>      for (i = 0; i < 16; ++i) {
>>> -        qemu_fprintf(f, " A%02d=%08x%c",
>>> -                     i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
>>> +        g_string_append_printf(buf, " A%02d=%08x%c",
>>> +                               i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
>>>      }
>>>  
>>>      xtensa_sync_phys_from_window(env);
>>> -    qemu_fprintf(f, "\n");
>>> +    g_string_append_printf(buf, "\n");
>>
>> g_string_append_c(); pre-existing but better to move it before
>> xtensa_sync_phys_from_window().
> 
> I don't want to be re-arranging the code in this series. It is just
> a straight search/replace of qemu_fprintf with g_string_append_printf,
> with the bare minimum of other changes,  to minimize risk of breaking
> something unexpected.

Fair enough. Max already rejected my suggestions ;) So:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


