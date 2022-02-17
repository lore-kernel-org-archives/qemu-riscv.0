Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKb9O-00005y-0W
	for mharc-qemu-riscv@gnu.org; Thu, 17 Feb 2022 02:24:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nKb97-0008Vs-Ui; Thu, 17 Feb 2022 02:24:11 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:60508 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nKb8s-0000ml-1p; Thu, 17 Feb 2022 02:23:58 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowADX3tr_9w1iVnrrAA--.25254S2;
 Thu, 17 Feb 2022 15:23:43 +0800 (CST)
Subject: Re: [PATCH v4 2/2] target/riscv: Enable Zicbo[m,z,p] instructions
To: =?UTF-8?Q?Christoph_M=c3=bcllner?= <cmuellner@linux.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>
References: <20220216154839.1024927-1-cmuellner@linux.com>
 <20220216154839.1024927-3-cmuellner@linux.com>
 <2c0fcafe-868a-ba7a-bf42-3a4ed2df19ba@iscas.ac.cn>
 <CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <4e7950d6-fdb0-f964-2cc3-f33bc14cb7b8@iscas.ac.cn>
Date: Thu, 17 Feb 2022 15:23:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------70C715CAC8995F4E8AC3FBD3"
Content-Language: en-US
X-CM-TRANSID: zQCowADX3tr_9w1iVnrrAA--.25254S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XryrAr1kGw4kZr1ruF4UArb_yoW7Zr4fpF
 W8GryUGFZrWr1kAw40qw1UAFWrWw18Ja1UWw18Xa4vk3y3Jr12qF1DZFZ09r47Jrs7Zw1Y
 ga1Yvr1xZ3sFvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCjr7xvwVCIw2I0I7xG6c02
 F41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VU889N3UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Feb 2022 07:24:18 -0000

This is a multi-part message in MIME format.
--------------70C715CAC8995F4E8AC3FBD3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/2/17 上午11:59, Christoph Müllner 写道:
>
>
> On Thu, Feb 17, 2022 at 3:15 AM Weiwei Li <liweiwei@iscas.ac.cn 
> <mailto:liweiwei@iscas.ac.cn>> wrote:
>
>
>     在 2022/2/16 下午11:48, Christoph Muellner 写道:
>     > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>     > index 39ffb883fc..04500fe352 100644
>     > --- a/target/riscv/cpu.c
>     > +++ b/target/riscv/cpu.c
>     > @@ -764,6 +764,10 @@ static Property riscv_cpu_properties[] = {
>     >       DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters,
>     true),
>     >       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>     >       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>     > +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
>     > +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
>     > +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU,
>     cfg.cbom_blocksize, 64),
>     > +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU,
>     cfg.cboz_blocksize, 64),
>     Why use two different cache block size here? Is there any new spec
>     update for this?
>
>
> No, we are talking about the same specification.
>
> Section 2.7 states the following:
> """
> The initial set of CMO extensions requires the following information 
> to be discovered by software:
> * The size of the cache block for management and prefetch instructions
> * The size of the cache block for zero instructions
> * CBIE support at each privilege level
> """
>
> So at least the spec authors did differentiate between the two block 
> sizes as well.
>
OK. This seems a little unreasonable from personal point.

>     >       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>     >       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>     >       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
>     > +
>     > +/* helper_zicbom_access
>     > + *
>     > + * Check access permissions (LOAD, STORE or FETCH as specified
>     in section
>     > + * 2.5.2 of the CMO specification) for Zicbom, raising either store
>     > + * page-fault (non-virtualised) or store guest-page fault
>     (virtualised).
>     > + */
>     > +static void helper_zicbom_access(CPURISCVState *env,
>     target_ulong address,
>     > +                                 uintptr_t ra)
>     > +{
>     > +    int ret;
>     > +    void* phost;
>     > +    int mmu_idx = cpu_mmu_index(env, false);
>     > +
>     > +    /* Get the size of the cache block for management
>     instructions. */
>     > +    RISCVCPU *cpu = env_archcpu(env);
>     > +    uint16_t cbomlen = cpu->cfg.cbom_blocksize;
>     > +
>     > +    /* Mask off low-bits to align-down to the cache-block. */
>     > +    address &= ~(cbomlen - 1);
>     > +
>     > +    /* A cache-block management instruction is permitted to access
>     > +     * the specified cache block whenever a load instruction, store
>     > +     * instruction, or instruction fetch is permitted to access the
>     > +     * corresponding physical addresses.
>     > +     */
>     > +    ret = probe_access_range_flags(env, address, cbomlen,
>     MMU_DATA_LOAD,
>     > +                                   mmu_idx, true, &phost, ra);
>     > +    if (ret == TLB_INVALID_MASK)
>     > +        ret = probe_access_range_flags(env, address, cbomlen,
>     MMU_INST_FETCH,
>     > +                                       mmu_idx, true, &phost, ra);
>     > +    if (ret == TLB_INVALID_MASK)
>     > +        probe_access_range_flags(env, address, cbomlen,
>     MMU_DATA_STORE,
>     > +                                 mmu_idx, false, &phost, ra);
>     > +}
>     > +
>
>
>     I think it's a little different here. Probe_access_range_flags may
>     trigger different execptions for different access_type. For example:
>
>     If  the page for the address  is executable and readable but not
>     writable,  and the access cannot pass the pmp check for all
>     access_type,
>
>     it may trigger access fault for load/fetch access, and trigger page
>     fault for  store access.
>
>
> Just to be clear:
> The patch does not trigger any fault for LOAD or FETCH because 
> nonfault is set
> to true (6th argument of probe_access_range_flags()).
> Only the last call to probe_access_range_flags() raises an exception.
>
> Section 2.5.2 states the following:
> """
> If access to the cache block is not permitted, a cache-block management
> instruction raises a store page fault or store guest-page fault 
> exception if address translation does not permit any
> access or raises a store access fault exception otherwise.
> """
>
> In your scenario we have (1...allowed; 0...not allowed):
> * read: perm:1, pmp:0
> * fetch: perm:1: pmp:0
> * write: perm:0, pmp:0
>
> Address translation would allow read and fetch access, but PMP blocks 
> that.
> So the "does not permit any"-part is wrong, therefore we should raise 
> a store page fault.

There is debate between us here. I think the opposite of "any" here is 
"permit one of access type" not "permit all access types".

  And from your above code,  it also will ignore check for fetch and 
write, if read access is permitted(the only difference with my example 
is that read also pass PMP check).

So if Address translation  allow read and fetch access, page fault 
shouldn't be triggered.

Regards,

Weiwei Li

>
> In fact, I can't predict what will happen, because the code in 
> target/riscv/cpu_helper.c does
> not really prioritize page faults or PMP faults. it returns one of 
> them, once they are encountered.
> In order to model this properly, we would have to refactor 
> cpu_helper.c to separate page permissions
> from PMP. However, that seems a bit out of scope for a Zicbo* support 
> patchset.
>
>
>     I think the final exception should be access fault instead of the
>     page
>     fault caused by probe_access_range_flags with MMU_DATA_STORE.
>
>     Regards,
>
>     Weiwei Li
>

--------------70C715CAC8995F4E8AC3FBD3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/2/17 上午11:59, Christoph Müllner
      写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Feb 17, 2022 at 3:15
            AM Weiwei Li &lt;<a href="mailto:liweiwei@iscas.ac.cn"
              moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            在 2022/2/16 下午11:48, Christoph Muellner 写道:<br>
            &gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
            &gt; index 39ffb883fc..04500fe352 100644<br>
            &gt; --- a/target/riscv/cpu.c<br>
            &gt; +++ b/target/riscv/cpu.c<br>
            &gt; @@ -764,6 +764,10 @@ static Property
            riscv_cpu_properties[] = {<br>
            &gt;       DEFINE_PROP_BOOL("Counters", RISCVCPU,
            cfg.ext_counters, true),<br>
            &gt;       DEFINE_PROP_BOOL("Zifencei", RISCVCPU,
            cfg.ext_ifencei, true),<br>
            &gt;       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr,
            true),<br>
            &gt; +    DEFINE_PROP_BOOL("zicbom", RISCVCPU,
            cfg.ext_icbom, true),<br>
            &gt; +    DEFINE_PROP_BOOL("zicboz", RISCVCPU,
            cfg.ext_icboz, true),<br>
            &gt; +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU,
            cfg.cbom_blocksize, 64),<br>
            &gt; +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU,
            cfg.cboz_blocksize, 64),<br>
            Why use two different cache block size here? Is there any
            new spec <br>
            update for this?<br>
          </blockquote>
          <div><br>
          </div>
          <div>No, we are talking about the same specification.</div>
          <div><br>
          </div>
          <div>Section 2.7 states the following:<br>
          </div>
          <div>"""</div>
          <div>The initial set of CMO extensions requires the following
            information to be discovered by software:<br>
            * The size of the cache block for management and prefetch
            instructions<br>
            * The size of the cache block for zero instructions<br>
            * CBIE support at each privilege level<br>
          </div>
          <div>"""</div>
          <div><br>
          </div>
          <div>So at least the spec authors did differentiate between
            the two block sizes as well.</div>
          <div> <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>OK. This seems a little unreasonable from personal point.</p>
    <blockquote type="cite"
cite="mid:CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt;       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh,
            false),<br>
            &gt;       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU,
            cfg.ext_zfhmin, false),<br>
            &gt;       DEFINE_PROP_BOOL("Zve32f", RISCVCPU,
            cfg.ext_zve32f, false),<br>
            &gt; +<br>
            &gt; +/* helper_zicbom_access<br>
            &gt; + *<br>
            &gt; + * Check access permissions (LOAD, STORE or FETCH as
            specified in section<br>
            &gt; + * 2.5.2 of the CMO specification) for Zicbom, raising
            either store<br>
            &gt; + * page-fault (non-virtualised) or store guest-page
            fault (virtualised).<br>
            &gt; + */<br>
            &gt; +static void helper_zicbom_access(CPURISCVState *env,
            target_ulong address,<br>
            &gt; +                                 uintptr_t ra)<br>
            &gt; +{<br>
            &gt; +    int ret;<br>
            &gt; +    void* phost;<br>
            &gt; +    int mmu_idx = cpu_mmu_index(env, false);<br>
            &gt; +<br>
            &gt; +    /* Get the size of the cache block for management
            instructions. */<br>
            &gt; +    RISCVCPU *cpu = env_archcpu(env);<br>
            &gt; +    uint16_t cbomlen = cpu-&gt;cfg.cbom_blocksize;<br>
            &gt; +<br>
            &gt; +    /* Mask off low-bits to align-down to the
            cache-block. */<br>
            &gt; +    address &amp;= ~(cbomlen - 1);<br>
            &gt; +<br>
            &gt; +    /* A cache-block management instruction is
            permitted to access<br>
            &gt; +     * the specified cache block whenever a load
            instruction, store<br>
            &gt; +     * instruction, or instruction fetch is permitted
            to access the<br>
            &gt; +     * corresponding physical addresses.<br>
            &gt; +     */<br>
            &gt; +    ret = probe_access_range_flags(env, address,
            cbomlen, MMU_DATA_LOAD,<br>
            &gt; +                                   mmu_idx, true,
            &amp;phost, ra);<br>
            &gt; +    if (ret == TLB_INVALID_MASK)<br>
            &gt; +        ret = probe_access_range_flags(env, address,
            cbomlen, MMU_INST_FETCH,<br>
            &gt; +                                       mmu_idx, true,
            &amp;phost, ra);<br>
            &gt; +    if (ret == TLB_INVALID_MASK)<br>
            &gt; +        probe_access_range_flags(env, address,
            cbomlen, MMU_DATA_STORE,<br>
            &gt; +                                 mmu_idx, false,
            &amp;phost, ra);<br>
            &gt; +}<br>
            &gt; +<br>
            <br>
            <br>
            I think it's a little different here.
            Probe_access_range_flags may <br>
            trigger different execptions for different access_type. For
            example:<br>
            <br>
            If  the page for the address  is executable and readable but
            not <br>
            writable,  and the access cannot pass the pmp check for all
            access_type,<br>
            <br>
            it may trigger access fault for load/fetch access, and 
            trigger page <br>
            fault for  store access.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Just to be clear:</div>
          <div>The patch does not trigger any fault for LOAD or FETCH
            because nonfault is set</div>
          <div>to true (6th argument of probe_access_range_flags()).</div>
          <div>Only the last call to probe_access_range_flags() raises
            an exception.</div>
          <div><br>
          </div>
          <div>Section 2.5.2 states the following:<br>
          </div>
          <div>"""</div>
          <div>If access to the cache block is not permitted, a
            cache-block management<br>
            instruction raises a store page fault or store guest-page
            fault exception if address translation does not permit any<br>
            access or raises a store access fault exception otherwise.<br>
          </div>
          <div>"""</div>
          <div><br>
          </div>
          <div>In your scenario we have (1...allowed; 0...not allowed):</div>
          <div>* read: perm:1, pmp:0</div>
          <div>* fetch: perm:1: pmp:0</div>
          <div>* write: perm:0, pmp:0</div>
          <div><br>
          </div>
          <div>Address translation would allow read and fetch access,
            but PMP blocks that.</div>
          <div>So the "does not permit any"-part is wrong, therefore we
            should raise a store page fault.</div>
        </div>
      </div>
    </blockquote>
    <p>There is debate between us here. I think the opposite of "any"
      here is "permit one of access type" not "permit all access types".</p>
    <p> And from your above code,  it also will ignore check for fetch
      and write, if read access is permitted(the only difference with my
      example is that read also pass PMP check).</p>
    <p>So if Address translation  allow read and fetch access, page
      fault shouldn't be triggered. <br>
    </p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
cite="mid:CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>In fact, I can't predict what will happen, because the
            code in target/riscv/cpu_helper.c does</div>
          <div>not really prioritize page faults or PMP faults. it
            returns one of them, once they are encountered.</div>
        </div>
      </div>
    </blockquote>
    <blockquote type="cite"
cite="mid:CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>In order to model this properly, we would have to
            refactor cpu_helper.c to separate page permissions</div>
          <div>from PMP. However, that seems a bit out of scope for a
            Zicbo* support patchset.</div>
          <div><br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            I think the final exception should be access fault instead
            of the page <br>
            fault caused by probe_access_range_flags with
            MMU_DATA_STORE.<br>
            <br>
            Regards,<br>
            <br>
            Weiwei Li<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------70C715CAC8995F4E8AC3FBD3--


