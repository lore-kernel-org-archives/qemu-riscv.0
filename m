Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQBpF-0005eq-Ih
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 13:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQBpE-0005eC-8r
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 13:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQBpC-000603-JN
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 13:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631638945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kkIDLD9CAOhbVHN5WBQLyfGlMRaq0nuzR36iSZPAuPQ=;
 b=A0vAvufc//zqTKx72ys4Z57cdMwvhG6+/sN95vVuk1UrP37nRw7+HIPfxsIvm0qRHDHnyk
 r/12ExvdXdocJprYna9AYfiBP21vwgRRECpIbMhz6lYZzqX7wgtJ9pMwj7AC0VwYLMWj5l
 gTS6OimCQfDXNb3rOTwmD6+XWGMsz78=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-IIbj-XnGOcKYA_7z0lQKig-1; Tue, 14 Sep 2021 13:02:25 -0400
X-MC-Unique: IIbj-XnGOcKYA_7z0lQKig-1
Received: by mail-wr1-f69.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so4242475wrl.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Sep 2021 10:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kkIDLD9CAOhbVHN5WBQLyfGlMRaq0nuzR36iSZPAuPQ=;
 b=UBGodmZASnl7vqRe1GXPN/GZrEAhwWIz3XybN7E1mnZrBIOqEnOh+c13Swxmv9GLaJ
 fLkyRCL65jin88Cs/3rI+lxi2CKbkRmhthuknn7b8vhH9b9en1k8f2MbfTu6fz6NQ7Ad
 cw5Yonw2jM0WxZCA9R1liyj7hjcUiAz/VCtF+fjG3CGmfv42lUJZHKpEUNQ23YvwJZ5C
 kDx8s/f7HsUAwxqinUxuRuzL9bPMsg1scMEPZD1Cph4SL2Wdv9AYp1plU4ty4DgBupcN
 mNbR7yiAtdJ3WpUXnfy7N3saQ8aLXOFZmoysaDvGI+u6jvtjKrC7gSb+462wVmjpT8NJ
 1hVQ==
X-Gm-Message-State: AOAM530k/Fin88BcmCVcb5VVTc7BMRarYYwPFzpmT20JpOnJvjGVPbAD
 /Ak6VzqHlZApc5P17VJcwOY6uEqmHAvUWB7SNVMVUZ8VO3w+eYUnAG7k6R6FcQTY+POUnFSyk5b
 2DwmaDk912ci9sHc=
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr67709wmc.41.1631638943498;
 Tue, 14 Sep 2021 10:02:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywCeUOwKb0Nwf7Bc9T1bwAw8IWks6SDEptqg79RpK/8s0eZGsx2c6ss5LiNu5s92qEApsLbw==
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr67619wmc.41.1631638943057;
 Tue, 14 Sep 2021 10:02:23 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id k1sm10860003wrz.61.2021.09.14.10.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:02:22 -0700 (PDT)
Subject: Re: [PATCH v2 42/53] hw/core: introduce a 'format_tlb' callback
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-43-berrange@redhat.com>
 <818d439f-337e-a73c-9e22-fbf8a119435f@redhat.com>
 <YUDPECQJraD3thwi@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a127efbf-8953-2ec5-9ba0-badbce949264@redhat.com>
Date: Tue, 14 Sep 2021 19:02:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUDPECQJraD3thwi@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Sep 2021 17:02:28 -0000

On 9/14/21 6:34 PM, Daniel P. Berrangé wrote:
> On Tue, Sep 14, 2021 at 05:56:09PM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
>>> This will allow us to reduce duplication between the different targets
>>> implementing the 'info tlb' command.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>  hw/core/cpu-common.c  |  9 +++++++++
>>>  include/hw/core/cpu.h | 11 +++++++++++
>>>  2 files changed, 20 insertions(+)
>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 4c47e1df18..64fc57c8d9 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>>   * @has_work: Callback for checking if there is work to do.
>>>   * @memory_rw_debug: Callback for GDB memory access.
>>>   * @format_state: Callback for formatting state.
>>> + * @format_tlb: Callback for formatting memory mappings

"... for formatting translations of virtual to physical memory mappings"

>>>   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
>>>   * @set_pc: Callback for setting the Program Counter register. This
>>>   *       should have the semantics used by the target architecture when
>>> @@ -136,6 +137,7 @@ struct CPUClass {
>>>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>>>                             uint8_t *buf, int len, bool is_write);
>>>      void (*format_state)(CPUState *cpu, GString *buf, int flags);
>>> +    void (*format_tlb)(CPUState *cpu, GString *buf);
>>
>> Doesn't this belong to SysemuCPUOps?
> 
> I can't really answer, since my knowledge of this area of QEMU code is
> fairly mimimal. I put it here because it is basically serving the same
> purpose as the "format_state" callback immediately above it, which was
> a rename of the existing "dump_state" callback. I assumed whatever was
> there already was a good practice to follow[1]...

Since it involves physical memory, I'm pretty sure this is sysemu
specific. Beside in the following patches you guard the handlers
with '#ifndef CONFIG_USER_ONLY'.

Good news, there is very few changes needed in your patches, for
example the next patch:

-- >8 --
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ab86224ee23..9d2bd2e2ef4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6732,6 +6732,7 @@ static Property x86_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"

 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .format_tlb = x86_cpu_format_tlb,
     .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
@@ -6765,9 +6766,6 @@ static void x86_cpu_common_class_init(ObjectClass
*oc, void *data)
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->has_work = x86_cpu_has_work;
     cc->format_state = x86_cpu_format_state;
-#ifndef CONFIG_USER_ONLY
-    cc->format_tlb = x86_cpu_format_tlb;
-#endif
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
---

> 
> Regards,
> Daniel
> 
> [1] yes assuming these things is often foolish in QEMU :-)
> 


